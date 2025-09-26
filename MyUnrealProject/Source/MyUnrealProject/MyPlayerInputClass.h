#pragma once

#include "CoreMinimal.h"
#include "GameFramework/PlayerController.h"
#include "MyPlayerInputClass.generated.h"

/**
 * 
 */
UCLASS()
class MYUNREALPROJECT_API AMyPlayerInputClass : public APlayerController
{
	GENERATED_BODY()

public:
	AMyPlayerInputClass();

protected:
	// Called when the game starts or when spawned
	virtual void BeginPlay() override;

public:
	// Called every frame
	virtual void Tick(float DeltaTime) override;

	// Input functions
	void SetupInputComponent() override;

	// Example input bindings
	void MoveForward(float Value);
	void MoveRight(float Value);
	void LookUp(float Value);
	void Turn(float Value);

private:
	// Variables for input
	float MoveForwardValue;
	float MoveRightValue;
	float LookUpValue;
	float TurnValue;
};