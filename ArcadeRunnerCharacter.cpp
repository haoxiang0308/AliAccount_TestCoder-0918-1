// Fill me in with C++ code for an Unreal Engine player input class

#pragma once

#include "CoreMinimal.h"
#include "GameFramework/Character.h"
#include "ArcadeRunnerCharacter.generated.h"

UCLASS()
class ARCADEGAME_API AArcadeRunnerCharacter : public ACharacter
{
	GENERATED_BODY()

public:
	// Sets default values for this character's properties
	AArcadeRunnerCharacter();

protected:
	// Called when the game starts or when spawned
	virtual void BeginPlay() override;

public:	
	// Called every frame
	virtual void Tick(float DeltaTime) override;

	// Called to bind functionality to input
	virtual void SetupPlayerInputComponent(class UInputComponent* PlayerInputComponent) override;

	// Input mapping functions
	void MoveForward(float Value);
	void MoveRight(float Value);
	void Jump();

private:
	// Keep track of movement input
 FVector MovementInputVector;
};