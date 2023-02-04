// Fill out your copyright notice in the Description page of Project Settings.

#pragma once

#include "CoreMinimal.h"
#include "GameFramework/Actor.h"
#include "GameFramework/CheatManager.h"
#include "ISpawner.h"
#include "SpawnCheats.generated.h"

/**
 * 
 */
UCLASS(NotBlueprintable)
class USpawnCheats : public UCheatManagerExtension
{
	GENERATED_BODY()

public:
	~USpawnCheats();

	UFUNCTION(Exec)
	void SpawnWorker();

	bool ProcessConsoleExec(const TCHAR* Cmd, FOutputDevice& Ar, UObject* Executor) override;

	static void AddSpawner(ISpawner* spawner);

	static void RemoveSpawner(ISpawner* spawner);

private:
	static FDelegateHandle cheatManagerDelegate;

	static TArray<ISpawner*> workerSpawners;
};
