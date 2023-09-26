// Fill out your copyright notice in the Description page of Project Settings.


#include "SpawnCheats.h"
#include "Util.h"

FDelegateHandle USpawnCheats::cheatManagerDelegate = UCheatManager::RegisterForOnCheatManagerCreated(FOnCheatManagerCreated::FDelegate::CreateLambda(
	[](UCheatManager* CheatManager)
	{
		CheatManager->AddCheatManagerExtension(NewObject<USpawnCheats>(CheatManager));
	}));

TArray<ISpawner*> USpawnCheats::spawners{};

USpawnCheats::~USpawnCheats()
{
	UCheatManager::UnregisterFromOnCheatManagerCreated(cheatManagerDelegate);
}

void USpawnCheats::SpawnCreature()
{
	for (ISpawner* spawner : spawners)
	{
		spawner->Spawn();
	}
}

void USpawnCheats::SpawnWorker()
{
    SetSpawnType(EWorkerType::WORKER);
    SpawnCreature();
}

void USpawnCheats::SpawnFinder()
{
    SetSpawnType(EWorkerType::FINDER);
    SpawnCreature();
}

bool USpawnCheats::ProcessConsoleExec(const TCHAR* Cmd, FOutputDevice& Ar, UObject* Executor)
{
	if (FString{ Cmd } == "spawn worker")
	{
		SetSpawnType(EWorkerType::WORKER);
	}
	else if (FString{ Cmd } == "spawn finder")
	{
		SetSpawnType(EWorkerType::FINDER);
	}
	else
	{
		return false;
	}

	SpawnCreature();
	return true;
}

void USpawnCheats::AddSpawner(ISpawner* spawner)
{
	if (spawners.Find(spawner) == INDEX_NONE)
	{
		spawners.Push(spawner);
	}
}

void USpawnCheats::RemoveSpawner(ISpawner* spawner)
{
	if (spawner != nullptr)
	{
		spawners.Remove(spawner);
	}
}

void USpawnCheats::SetSpawnType(EWorkerType type)
{
	for (ISpawner* spawner : spawners)
	{
		spawner->SetType(type);
	}
}
