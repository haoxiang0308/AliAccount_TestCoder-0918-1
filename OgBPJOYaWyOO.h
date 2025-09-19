// OgBPJOYaWyOO.h
// Player input handler class for Unreal Engine

#pragma once

#include "CoreMinimal.h"
#include "GameFramework/Pawn.h"
#include "OgBPJOYaWyOO.generated.h"

UCLASS()
class AOgBPJOYaWyOO : public APawn
{
	GENERATED_BODY()

public:
	// Sets default values for this pawn's properties
	AOgBPJOYaWyOO();

protected:
	// Called when the game starts or when spawned
	virtual void BeginPlay() override;

public:	
	// Called every frame
	virtual void Tick(float DeltaTime) override;

	// Called to bind functionality to input
	virtual void SetupPlayerInputComponent(class UInputComponent* PlayerInputComponent) override;

	// Input functions
	void MoveForward(float Value);
	void MoveRight(float Value);
	
	void StartJump();
	void StopJump();

private:
	bool bPressedJump;
};