// PlayerInputHandler.h
#pragma once

#include "CoreMinimal.h"
#include "GameFramework/PlayerController.h"
#include "PlayerInputHandler.generated.h"

/**
 * Player Input Handler class that manages player input bindings and actions
 */
UCLASS()
class MYGAME_API APlayerInputHandler : public APlayerController
{
	GENERATED_BODY()

public:
	// Constructor
	APlayerInputHandler();

protected:
	// Called when the game starts or when spawned
	virtual void BeginPlay() override;

public:
	// Called every frame
	virtual void Tick(float DeltaTime) override;

	// Called to bind functionality to input
	virtual void SetupInputComponent() override;

	// Input functions
	UFUNCTION()
	void MoveForward(float Value);

	UFUNCTION()
	void MoveRight(float Value);

	UFUNCTION()
	void Turn(float Rate);

	UFUNCTION()
	void LookUp(float Rate);

	UFUNCTION()
	void Jump();

	UFUNCTION()
	void StopJumping();

private:
	// Reference to the input component
	class UInputComponent* MyInputComponent;
};