// Fill out your copyright notice in the Description page of Project Settings.

#pragma once

#include "CoreMinimal.h"
#include "GameFramework/PlayerController.h"
#include "MyPlayerController.generated.h"

/**
 * 
 */
UCLASS()
class CPPGAME_API AMyPlayerController : public APlayerController
{
	GENERATED_BODY()

public:
	virtual void SetupInputComponent() override;

private:
	// Input functions
	void Jump();
	void StopJumping();
	void MoveForward(float Value);
	void MoveRight(float Value);
};