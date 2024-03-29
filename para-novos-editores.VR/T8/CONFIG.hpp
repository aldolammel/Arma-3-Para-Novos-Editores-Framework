/*
 =======================================================================================================================

	T8 Units Script
	
	Unit Spawn & Communication Script
	
	File:				CONFIG.hpp
	Author:				T-800a
	E-Mail:				t-800a@gmx.net
	
	init.sqf: 			[] execVM "T8_missionEXEC.sqf";
	
	description.ext:	#include <T8\CONFIG.hpp>
						class cfgFunctions
						{
							#include <T8\FUNCTIONS.hpp>
						};
						
	check  "T8_missionEXEC.sqf" to start spawning stuff...
		
	// Some information about variables saved to groups

	T8U_gvar_Comm 			-> [ bool, bool, bool ]		-> shares info, can be called, can react when attacked
	T8U_gvar_Origin			-> array					-> originTask: Marker, originTask: Order, ... 
	T8U_gvar_Settings		-> array or string			-> add. settings array defined in the units arrays
	T8U_gvar_Assigned		-> string					-> has Task Assigned: NO_TASK, CQC_SHOT, DC_ASSIST, ...
	T8U_gvar_Member			-> array					-> array of the origin units who are spawned
	T8U_gvar_Regrouped		-> bool						-> for GARRISON, PATROL_GARRISON: is set true when after group is released from task, now they can do their new task
	T8U_gvar_FiredEvent		-> array					-> Array filled by Fired Event
	T8U_gvar_Attacked		-> integer					-> time units of the group were last HIT ... if 'first time' force prone (0 targets) / suppressing fire (1++ targets)
	T8U_gvar_called			-> integer					-> time unit sent last call for help (general / set if other T8U group is called)
	T8U_gvar_DACcalled		-> integer					-> time Group last called DAC for HELP
	T8U_gvar_PARAcalled		-> integer					-> time Group last called for a Support (e.g. Para drop)
	T8U_gvar_ignoreGroup	-> bool						-> set by group handle if it shall ignore group (for quicker execution after 'first check')
	T8U_gvar_Introduced		-> bool						-> set true after editor groub is introduced to T8U
	
	T8U_ovar_lastSmoke
	T8U_gvar_behaviourSet
	T8U_gvar_lastBehaviour

	This work is licensed under the Creative Commons Attribution-NonCommercial-ShareAlike 4.0 International License.
	To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-sa/4.0/ or send a letter to 
	Creative Commons, 444 Castro Street, Suite 900, Mountain View, California, 94041, USA.

 =======================================================================================================================
*/

#define false			1
#define true			2

#define __EAST			1
#define __WEST			2
#define __RESI			3
#define __CIVI			4


class cfgT8Units
{
	// ------------------------------------------------------------------------------
	// DEBUG Settings
	// Após todos os testes que você quiser fazer com a T8, é fundamental você mudar estas 4 configs abaixo para FALSE para a T8 não ficar sendo mostrada no mapa dos admins logados no server durante a partida. Mais lá embaixo (até a linha 169) há configurações importantes também. Vai rolando e se ligando nos comentários.

	class debug
	{
		// general debug switch
		enable				= false;

		// Ativa os hints de debug, ou seja, aparecerá na tela uma mensagem avisando que os grupos de inimigos de uma determinada zona spawnaram.
		allow_hints			= false;

		// Ativa os waypoints dos grupos inimigos no mapa para debug.
		allow_marker		= false;

		// send debug messages to Killzone Kids console instead of RPT file
		// http://killzonekid.com/arma-console-extension-debug_console-dll-v3-0/
		allow_console		= false;	
	};


	// ------------------------------------------------------------------------------
	// MAIN configuration

	class main
	{
		// run the script on headless client and not on the Server
		// !! WARNING: this is untested !!
		use_HeadlessClient	= false;

		// option to register units with ZEUS
		// this may slow down spawning
		// will registers spawned units with "allCurators"
		allow_ZEUS			= true;

		// standard side for spawned units
		// 					__EAST = 1
		//					__WEST = 2
		//					__RESI = 3
		//					__CIVI = 4
		enemySide			= 1;
		
		// selected modset for unit group compilation
		// see:		- class groupCompilations
		// 			- class groupRandomCompilations		
		modSet				= "vanilla";

		// RESISTANCE diplomacy 'switch'
		// for finding enemies and allies when calling for help - check with your mission settings
		//   0 : RESISTANCE neutral
		//   1 : RESISTANCE friendly to WEST
		//   2 : RESISTANCE friendly to EAST
		//   3 : RESISTANCE enemy of both; 
		diplomacy			= 1;
		
		// if group is in overwhelming superiority of XXX over their enemies, they wont call for help
		superiority			= 3;
		
		// the group leader shares info about known enemies to friendly units within XXX meter
		// knowsAbout > 1
		range_reveal		= 500;
		
		// group leader searches for help within XXX meter
		range_helpCall		= 1500;
		
		// a group can only call one other group each XXX seconds for help
		timeout_helpCall	= 60;
		
		// every XXX seconds a group can call in for a Support (e.g. para drop)
		// if the group has a squad leader or officer as their group leader
		timeout_support		= 180;
		
		// when the group is finished with their current task they return to their origin task after XXX seconds
		timeout_taskReturn	= 30;
		
		// units in zones are cached after XXX seconds when zone is deactivated
		timeout_caching		= 15;
		
		// zone radius + XXX meter is the distance in which units will patrol around a zone (waypoint positions affected)
		range_PatrolAround	= 50;
		
		// enable fatigue for ALL spawned units
		enable_fatigue		= false;
		
		// vehicles a group can use to travel greater distance (when they are called for help) 
		// if you want to allow vehicles from other addons, add them here
		reinforcementVehicles[] =
		{
			"APC_Tracked_01_base_F", "APC_Tracked_02_base_F", "Wheeled_APC_F", "Truck_01_base_F", "Truck_02_base_F", "MRAP_01_base_F",
			"MRAP_02_base_F", "MRAP_03_base_F", "C_Offroad_01_F", "I_G_Offroad_01_F"
		};

		// units that can lay down suppressive fire
		// if you want to allow units from other addons, add them here
		suppressingUnits[] = 
		{
			"rhs_msv_arifleman","rhs_msv_arifleman","rhs_msv_machinegunner","rhs_msv_emr_arifleman","rhs_msv_emr_machinegunner","rhs_mvd_izlom_arifleman","rhs_mvd_izlom_machinegunner","rhs_vdv_arifleman","rhs_vdv_des_arifleman","rhs_vdv_recon_arifleman","rhs_vdv_machinegunner","rhs_vdv_des_machinegunner","rhs_vdv_flora_machinegunner","rhs_vdv_mflora_machinegunner","rhs_vmf_recon_arifleman","rhs_vmf_flora_machinegunner","rhsgref_cdf_b_para_machinegunner","rhsgref_cdf_b_ngd_machinegunner","rhsgref_cdf_b_para_autorifleman","rhsgref_cdf_para_autorifleman","rhsgref_hidf_machinegunner","rhsgref_hidf_autorifleman","rhsgref_tla_machinegunner","rhsgref_cdf_reg_machinegunner","rhsgref_cdf_para_machinegunner","rhsgref_cdf_ngd_machinegunner","rhsgref_cdf_un_machinegunner","rhsgref_ins_g_machinegunner","rhsgref_nat_machinegunner","rhsgref_nat_pmil_machinegunner","rhsgref_ins_machinegunner","rhsusf_army_ocp_machinegunner","rhsusf_army_ocp_arb_machinegunner","rhsusf_army_ocp_autorifleman","rhsusf_army_ocp_arb_autorifleman","rhsusf_army_ucp_autorifleman","rhsusf_army_ucp_arb_autorifleman","rhsusf_army_ucp_machinegunner","rhsusf_army_ucp_arb_machinegunner","rhsusf_usmc_marpat_d_autorifleman_m249","rhsusf_usmc_marpat_d_machinegunner","rhsusf_usmc_marpat_wd_machinegunner","rhsusf_usmc_marpat_wd_autorifleman_m249","rhsusf_usmc_recon_marpat_d_machinegunner","rhsusf_usmc_recon_marpat_d_machinegunner_m249","rhsusf_usmc_recon_marpat_d_machinegunner_m249_fast","rhsusf_usmc_recon_marpat_d_machinegunner_m249_lite","rhsusf_usmc_recon_marpat_wd_machinegunner","rhsusf_usmc_recon_marpat_wd_machinegunner_m249","rhsusf_usmc_recon_marpat_wd_machinegunner_m249_fast","rhsusf_usmc_recon_marpat_wd_machinegunner_m249_lite","LOP_SLA_Infantry_MG","LOP_SYR_Infantry_MG","LOP_TKA_Infantry_MG","LOP_BH_Infantry_AR_2","LOP_BH_Infantry_AR","LOP_AA_Infantry_MG_2","LOP_AA_Infantry_MG","LOP_AA_Police_MG","LOP_CDF_Infantry_MG","LOP_CDF_Infantry_MG_2","LOP_GRE_Infantry_MG","LOP_IA_Infantry_MG_2","LOP_IA_Infantry_MG","PO_IA_Infantry_SF_MG","LOP_IA_Infantry_W_MG_2","LOP_IA_Infantry_W_MG","LOP_PESH_Infantry_MG","LOP_PESH_IND_Infantry_MG","LOP_IRAN_Infantry_AR_2","LOP_IRAN_Infantry_AR","LOP_IRAN_Infantry_SF_AR","LOP_NAPA_Infantry_MG","LOP_ISTS_Infantry_B_AR","LOP_RACS_Infantry_MG","LOP_TRK_Infantry_MG","LOP_UKR_Infantry_AR","LOP_UA_Infantry_MG","LOP_UN_Infantry_MG","LOP_US_Infantry_MG_3","LOP_US_Infantry_MG","LOP_US_Infantry_MG_2","LOP_ChDKZ_Infantry_MG","LOP_NK_Infantry_MG","LOP_AM_OPF_Infantry_AR","B_soldier_AAR_F","B_Patrol_Soldier_AR_F","B_Patrol_Soldier_MG_F","B_CTRG_Soldier_AR_tna_F","B_G_Soldier_AR_F","B_T_Soldier_AR_F","B_W_Soldier_AR_F","I_Soldier_AR_F","I_G_Soldier_AR_F","I_E_Soldier_AR_F"
		};
		
		// ignored buildings for garrison and occupy
		ignoredBuildings[] = 
		{
			"Land_Garage_V1_ruins_F", "Land_i_Garage_V1_F", "Land_i_Garage_V1_dam_F", "Land_i_Garage_V2_F", "Land_i_Garage_V2_dam_F", "Land_i_Addon_03_V1_F", "Land_i_Addon_03mid_V1_F", "Land_i_Addon_04_V1_F"
		};

		// a group will go RED when in combat, then go GREEN after some time ( T8_UnitsEngageAtWillTime ), and then return to T8U_fnc_SpawnCombatMode
		enable_CBM			= false;
	};


	// ------------------------------------------------------------------------------
	// options to work with DAC by Silola
	
	class dac
	{
		// allow T8U to send a "call for help" to DAC
		enable				= false;
		
		// timeout for a group until it can sent the next "call for help"
		timeout				= 180;			
	};


	// ------------------------------------------------------------------------------
	// MAIN behavior and skills configuration
	
	class behaviorAndSkills
	{
/*
		# Skill Examples
		# militia ( untrained )
			aimingAccuracy	= 0.20;
			aimingShake		= 0.15;
			aimingSpeed		= 0.20;
			spotDistance	= 0.75;
			spotTime		= 0.70;
			courage			= 0.30;
			reloadSpeed		= 0.20;
			commanding		= 0.50;
			general			= 0.50;
	
		# regular forces
			aimingAccuracy	= 0.30;
			aimingShake		= 0.25;
			aimingSpeed		= 0.30;
			spotDistance	= 0.85;
			spotTime		= 0.75;
			courage			= 0.50;
			reloadSpeed		= 0.40;
			commanding		= 0.70;
			general			= 0.70;

		# special forces
			aimingAccuracy	= 0.45;
			aimingShake		= 0.40;
			aimingSpeed		= 0.50;
			spotDistance	= 0.95;
			spotTime		= 0.90;
			courage			= 0.70;
			reloadSpeed		= 0.60;
			commanding		= 0.90;
			general			= 0.90;

		# Behaivior Examples
		# aggressive
			behaivior[] =
			{
				"YELLOW",	// spawn Combat-Mode
				"RED",		// max. Combat-Mode when unit behaviour changes to COMBAT
				"WHITE",	// Combat-Mode after some time in max. Combat-Mode
				180			// time the group stays in max. Combat-Mode
			};

		# defensive
			behaivior[] = { "GREEN", "YELLOW", "GREEN", 90 };
	
		# medicore
			behaivior[] = { "GREEN", "RED", "GREEN", 120 };
*/	
		class west
		{
			class skills
			{
				class aimingAccuracy	{ value	= 0.45; };
				class aimingShake		{ value	= 0.40; };
				class aimingSpeed		{ value	= 0.50; };
				class spotDistance		{ value	= 0.95; };
				class spotTime			{ value	= 0.90; };
				class courage			{ value	= 0.70; };
				class reloadSpeed		{ value	= 0.60; };
				class commanding		{ value	= 0.90; };
				class general			{ value	= 0.90; };
			};
			
			behaivior[] = { "GREEN", "YELLOW", "GREEN", 90 };
		};
		
		class east
		{
			class skills
			{
				class aimingAccuracy	{ value	= 0.30; };
				class aimingShake		{ value	= 0.25; };
				class aimingSpeed		{ value	= 0.30; };
				class spotDistance		{ value	= 0.85; };
				class spotTime			{ value	= 0.75; };
				class courage			{ value	= 0.50; };
				class reloadSpeed		{ value	= 0.40; };
				class commanding		{ value	= 0.70; };
				class general			{ value	= 0.70; };
			};
			
			behaivior[] = { "YELLOW", "RED", "WHITE", 180 };
		};
		
		class guer
		{
			class skills
			{
				class aimingAccuracy	{ value	= 0.30; };
				class aimingShake		{ value	= 0.25; };
				class aimingSpeed		{ value	= 0.30; };
				class spotDistance		{ value	= 0.85; };
				class spotTime			{ value	= 0.75; };
				class courage			{ value	= 0.50; };
				class reloadSpeed		{ value	= 0.40; };
				class commanding		{ value	= 0.70; };
				class general			{ value	= 0.70; };
			};
			
			behaivior[] = { "GREEN", "RED", "GREEN", 120 };
		};
	};


	// ------------------------------------------------------------------------------
	// custom group settings

	class groupSettings
	{
		// some base classes
		class base_militia
		{
			class behaviorAndSkills
			{
				class skills
				{
					class aimingAccuracy	{ value	= 0.50; };
					class aimingShake		{ value	= 0.15; };
					class aimingSpeed		{ value	= 0.20; };
					class spotDistance		{ value	= 0.75; };
					class spotTime			{ value	= 0.70; };
					class courage			{ value	= 0.30; };
					class reloadSpeed		{ value	= 0.20; };
					class commanding		{ value	= 0.50; };
					class general			{ value	= 0.50; };
				};
				
				behaivior[] = { "GREEN", "RED", "GREEN", 120 };
			};
			
			teleport = false;
		};
		
		class base_regularForces
		{
			class behaviorAndSkills
			{
				class skills
				{
					class aimingAccuracy	{ value	= 0.30; };
					class aimingShake		{ value	= 0.25; };
					class aimingSpeed		{ value	= 0.30; };
					class spotDistance		{ value	= 0.85; };
					class spotTime			{ value	= 0.75; };
					class courage			{ value	= 0.50; };
					class reloadSpeed		{ value	= 0.40; };
					class commanding		{ value	= 0.70; };
					class general			{ value	= 0.70; };
				};
				
				behaivior[] = { "GREEN", "YELLOW", "GREEN", 90 };
			};
			
			teleport = false;
		};
		
		class base_specialForces
		{
			class behaviorAndSkills
			{
				class skills
				{
					class aimingAccuracy	{ value	= 0.45; };
					class aimingShake		{ value	= 0.40; };
					class aimingSpeed		{ value	= 0.50; };
					class spotDistance		{ value	= 0.95; };
					class spotTime			{ value	= 0.90; };
					class courage			{ value	= 0.70; };
					class reloadSpeed		{ value	= 0.60; };
					class commanding		{ value	= 0.90; };
					class general			{ value	= 0.90; };
				};
				
				behaivior[] = { "YELLOW", "RED", "WHITE", 180 };
			};
			
			teleport = false;
		};
		
		// 
		class teleport : base_militia
		{
			teleport = true;
		};
	};


	// ------------------------------------------------------------------------------
	// configuration for fixed unit containers	

	class groupCompilations
	{
		class vanilla
		{
			class west
			{
				fireteam[]	= {	"B_soldier_SL_F", "B_medic_F", "O_soldier_F", "B_soldier_AR_F" };
				squad[]		= {	"B_soldier_SL_F", "B_medic_F", "O_soldier_F", "B_soldier_AR_F", "B_soldier_TL_F", "B_soldier_F", "B_soldier_F", "B_soldier_LAT_F" };
				platoon[]	= {	"B_officer_F", "B_medic_F", "O_soldier_F", "B_soldier_AR_F", "B_soldier_TL_F", "B_soldier_F", "B_soldier_F", "B_soldier_LAT_F",
								"B_soldier_SL_F", "B_medic_F", "O_soldier_F", "B_soldier_AR_F", "B_soldier_TL_F", "B_soldier_F", "B_soldier_F", "B_soldier_LAT_F" };
			};
			
			class east
			{
				fireteam[]	= { "O_soldier_SL_F", "O_medic_F", "O_soldier_F", "O_soldier_AR_F" };
				squad[]		= { "O_soldier_SL_F", "O_medic_F", "O_soldier_F", "O_soldier_AR_F", "O_soldier_TL_F", "O_soldier_F", "O_soldier_F", "O_soldier_LAT_F" };
				platoon[]	= {	"O_officer_F", "O_medic_F", "O_soldier_F", "O_soldier_AR_F", "O_soldier_TL_F", "O_soldier_F", "O_soldier_F", "O_soldier_LAT_F",
								"O_soldier_SL_F", "O_medic_F", "O_soldier_F", "O_soldier_AR_F", "O_soldier_TL_F", "O_soldier_F", "O_soldier_F", "O_soldier_LAT_F" };
			};
			
			class guer
			{
				fireteam[]	= { "I_soldier_SL_F", "I_medic_F", "I_soldier_F", "I_soldier_AR_F" };
				squad[]		= { "I_soldier_SL_F", "I_medic_F", "I_soldier_F", "I_soldier_AR_F", "I_soldier_TL_F", "I_soldier_F", "I_soldier_F", "I_soldier_LAT_F" };
				platoon[]	= {	"I_officer_F", "I_medic_F", "I_soldier_F", "I_soldier_AR_F", "I_soldier_TL_F", "I_soldier_F", "I_soldier_F", "I_soldier_LAT_F",
								"I_soldier_SL_F", "I_medic_F", "I_soldier_F", "I_soldier_AR_F", "I_soldier_TL_F", "I_soldier_F", "I_soldier_F", "I_soldier_LAT_F" };
			};
			
			class civ
			{
				fireteam[]	= { "C_man_1_1_F", "C_man_1_2_F", "C_man_polo_1_F", "C_man_polo_2_F" };
				squad[]		= { "C_man_p_fugitive_F", "C_man_polo_1_F_asia", "C_man_1_1_F", "C_man_1_2_F", "C_man_1_3_F", "C_man_polo_1_F", "C_man_polo_2_F", "C_man_polo_3_F" };
				platoon[]	= { "C_man_p_fugitive_F", "C_man_polo_1_F_asia", "C_man_1_1_F", "C_man_1_2_F", "C_man_1_3_F", "C_man_polo_1_F", "C_man_polo_2_F", "C_man_polo_3_F",
								"C_man_p_fugitive_F", "C_man_polo_1_F_asia", "C_man_1_1_F", "C_man_1_2_F", "C_man_1_3_F", "C_man_polo_1_F", "C_man_polo_2_F", "C_man_polo_3_F" };
			};
		};
	};


	// ------------------------------------------------------------------------------
	// configuration for randomized unit containers
	//
	// if you want a randomized selection of units you can use the following function in your units array:
	//    [ "east", "infantry", 5, 3 ] call T8U_fnc_createUnitContainer
	// units selected by this function are defined below
	// if you add your custom selections (as example for different mods), please share them with me!

	class groupRandomCompilations
	{
		class vanilla
		{
			class west
			{
				infantry[]		= { "B_Soldier_F","B_Soldier_02_f","B_Soldier_03_f","B_Soldier_04_f","B_Soldier_05_f","B_Soldier_lite_F","B_Soldier_GL_F","B_soldier_AR_F","B_Soldier_SL_F","B_Soldier_TL_F","B_soldier_M_F","B_soldier_LAT_F","B_medic_F","B_soldier_repair_F","B_soldier_exp_F","B_Soldier_A_F","B_soldier_AT_F","B_soldier_AA_F","B_engineer_F","B_officer_F","B_soldier_PG_F","B_recon_F","B_recon_LAT_F","B_recon_exp_F","B_recon_medic_F","B_recon_TL_F","B_recon_M_F","B_recon_JTAC_F","B_spotter_F","B_sniper_F","B_support_MG_F","B_support_GMG_F","B_support_Mort_F","B_support_AMG_F","B_support_AMort_F","B_ghillie_lsh_F","B_ghillie_sard_F","B_ghillie_ard_F","B_Sharpshooter_F","B_Recon_Sharpshooter_F","B_HeavyGunner_F","B_G_Sharpshooter_F" };
				vehicles[]		= { "B_APC_Tracked_01_AA_F","B_MBT_01_cannon_F","B_MBT_01_cannon_F","B_MRAP_01_gmg_F","B_MRAP_01_hmg_F","B_G_Offroad_01_armed_F","B_APC_Wheeled_01_cannon_F","B_MBT_01_TUSK_F" };
				artillery[]		= { "B_MBT_01_mlrs_F","B_MBT_01_arty_F" };
				helicopter[]	= { "B_Heli_Light_01_armed_F","B_Heli_Attack_01_F" };
				air[]			= { "B_Plane_CAS_01_F" };
			};

			class east
			{
				infantry[]		= { "O_G_Soldier_F","O_G_Soldier_lite_F","O_G_Soldier_SL_F","O_G_Soldier_TL_F","O_G_Soldier_AR_F","O_G_medic_F","O_G_engineer_F","O_G_Soldier_exp_F","O_G_Soldier_GL_F","O_G_Soldier_M_F","O_G_Soldier_LAT_F","O_G_Soldier_A_F","O_G_officer_F","O_Soldier_F","O_officer_F","O_Soldier_lite_F","O_Soldier_GL_F","O_Soldier_AR_F","O_Soldier_SL_F", "O_Soldier_TL_F","O_soldier_M_F","O_Soldier_LAT_F","O_medic_F","O_soldier_repair_F","O_soldier_exp_F","O_Soldier_A_F","O_Soldier_AT_F","O_Soldier_AA_F","O_engineer_F","O_Sharpshooter_F","O_HeavyGunner_F","O_G_Sharpshooter_F","O_recon_F","O_recon_M_F","O_recon_LAT_F","O_recon_medic_F","O_recon_exp_F","O_recon_JTAC_F", "O_recon_TL_F","O_Pathfinder_F","O_sniper_F","O_ghillie_lsh_F","O_ghillie_sard_F","O_ghillie_ard_F" };
				vehicles[]		= { "O_APC_Tracked_02_cannon_F","O_APC_Tracked_02_AA_F","O_MBT_02_cannon_F","O_MRAP_02_hmg_F","O_MRAP_02_gmg_F","O_G_Offroad_01_armed_F","O_APC_Wheeled_02_rcws_F" };
				artillery[]		= { "O_MBT_02_arty_F" };
				helicopter[]	= { "O_Heli_Light_02_F","O_Heli_Light_02_v2_F","O_Heli_Attack_02_F","O_Heli_Attack_02_black_F" };
				air[]			= { "O_Plane_CAS_02_F" };
			};

			class guer
			{
				infantry[]		= { "I_G_Soldier_F","I_G_Soldier_lite_F","I_G_Soldier_SL_F","I_G_Soldier_TL_F","I_G_Soldier_AR_F","  	I_G_medic_F","I_G_engineer_F","I_G_Soldier_exp_F","I_G_Soldier_GL_F","I_G_Soldier_M_F","I_G_Soldier_LAT_F","I_G_Soldier_A_F","I_G_officer_F","I_Soldier_02_F","I_Soldier_03_F","I_Soldier_04_F","I_soldier_F","  	I_Soldier_lite_F","I_Soldier_A_F","I_Soldier_GL_F","I_Soldier_AR_F","I_Soldier_SL_F","I_Soldier_TL_F","I_Soldier_M_F","I_Soldier_LAT_F","I_Soldier_AT_F","I_Soldier_AA_F","I_medic_F","I_Soldier_repair_F","I_Soldier_exp_F","I_engineer_F","I_officer_F","I_Spotter_F","I_Sniper_F","I_Soldier_AAR_F","I_Soldier_AAT_F","I_Soldier_AAA_F","I_support_MG_F","I_support_GMG_F","I_support_Mort_F","I_support_AMG_F","I_support_AMort_F"," I_ghillie_lsh_F","I_ghillie_sard_F","I_ghillie_ard_F","I_G_Sharpshooter_F" };
				vehicles[]		= { "I_APC_tracked_03_cannon_F","I_MBT_03_cannon_F","I_G_Offroad_01_armed_F","I_MRAP_03_hmg_F","I_MRAP_03_gmg_F","I_APC_Wheeled_03_cannon_F" };
				artillery[]		= { "I_MBT_03_cannon_F" };
				helicopter[]	= { "I_Heli_light_03_F" };
				air[]			= { "I_Plane_Fighter_03_CAS_F","I_Plane_Fighter_03_AA_F" };
			};
			
			class civ
			{
				infantry[]		= {};
				vehicles[]		= {};
				artillery[]		= {};
				helicopter[]	= {};
				air[]			= {};
			};
		};
	};
};





///// END OF CONFIG FILE ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////