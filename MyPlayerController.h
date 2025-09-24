#pragma once

#include "CoreMinimal.h"
#include "GameFramework/PlayerController.h"
#include "MyPlayerController.generated.h"

/**
 * 
 */
UCLASS()
class MYGAME_API AMyPlayerController : public APlayerController
{
	GENERATED_BODY()

public:
	virtual void SetupInputComponent() override;

	// Example input functions
	void MoveForward(float Value);
	void MoveRight(float Value);
	void LookUp(float Value);
	void Turn(float Value);
	void Jump();

private:
	// Input mapping names
	UPROPERTY()
	class UInputMappingContext* DefaultMappingContext;

	UPROPERTY()
	class UInputAction* MoveForwardAction;

	UPROPERTY()
	class UInputAction* MoveRightAction;

	UPROPERTY()
	class UInputAction* LookUpAction;

	UPROPERTY()
	class UInputAction* TurnAction;

	UPROPERTY()
	class UInputAction* JumpAction;
};