#pragma semicolon 1
#pragma newdecls required

#define DEBUG

#define PLUGIN_AUTHOR "Blake/Underused"
#define PLUGIN_VERSION "1.00"

#include <sourcemod>
#include <sdktools>
#include <cstrike>
//#include <sdkhooks>

EngineVersion g_Game;

public Plugin myinfo = 
{
	name = "Welcome to Server",
	author = PLUGIN_AUTHOR,
	description = "This plugin prints 'Welcome to the server, <user>!' whenever a player joins.",
	version = PLUGIN_VERSION,
	url = "https://steamcommunity.com/id/Underused/"
};

public void OnPluginStart()
{
	g_Game = GetEngineVersion();
	if(g_Game != Engine_CSGO && g_Game != Engine_CSS)
	{
		SetFailState("This plugin is for CSGO/CSS only.");	
	}
}

public void OnClientPutInServer(int client) {
	char clientName[MAX_NAME_LENGTH];
	GetClientName(client, clientName, sizeof(clientName));
	PrintToChatAll("Welcome to the server, \x04%s\x01!", clientName);
}
