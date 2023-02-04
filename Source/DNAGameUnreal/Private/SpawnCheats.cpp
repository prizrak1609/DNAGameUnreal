// Fill out your copyright notice in the Description page of Project Settings.


#include "SpawnCheats.h"
#include "Util.h"

FDelegateHandle USpawnCheats::cheatManagerDelegate = UCheatManager::RegisterForOnCheatManagerCreated(FOnCheatManagerCreated::FDelegate::CreateLambda(
	[](UCheatManager* CheatManager)
	{
		CheatManager->AddCheatManagerExtension(NewObject<USpawnCheats>(CheatManager));
	}));

TArray<ISpawner*> USpawnCheats::workerSpawners{};

USpawnCheats::~USpawnCheats()
{
	UCheatManager::UnregisterFromOnCheatManagerCreated(cheatManagerDelegate);
}

void USpawnCheats::SpawnWorker()
{
	for (ISpawner* spawner : workerSpawners)
	{
		spawner->Spawn();
	}
}

bool USpawnCheats::ProcessConsoleExec(const TCHAR* Cmd, FOutputDevice& Ar, UObject* Executor)
{
	if (FString{ Cmd } == "Worker.Spawn")
	{
		SpawnWorker();
		return true;
	}
	return false;
}

void USpawnCheats::AddSpawner(ISpawner* spawner)
{
	switch (spawner->GetType())
	{
	case ISpawner::TYPE::WORKER:
		if (workerSpawners.Find(spawner) == INDEX_NONE)
		{
			workerSpawners.Push(spawner);
		}
		break;
	default: Util::PrintLog(FString::Format(TEXT("Unknown type %d"), { static_cast<int>(spawner->GetType()) })); break;
	}
	
}

void USpawnCheats::RemoveSpawner(ISpawner* spawner)
{
	if (spawner != nullptr)
	{
		workerSpawners.Remove(spawner);
	}
}
