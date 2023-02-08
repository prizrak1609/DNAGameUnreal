#pragma once

#include "CoreMinimal.h"

UENUM(BlueprintType)
enum class EWorkerType : uint8
{
	WORKER,
	FINDER,
	END UMETA(Hidden)
};
