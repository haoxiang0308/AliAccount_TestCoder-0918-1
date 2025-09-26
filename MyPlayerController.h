// Fill out your copyright notice in the Description page of Project Settings.

#pragma once

#include "CoreMinimal.h"
#include "EnhancedInputComponent.h"
#include "EnhancedInputSubsystems.h"
#include "InputAction.h"
#include "InputMappingContext.h"
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
	AMyPlayerController();

protected:
	// Called when the game starts or when spawned
	virtual void BeginPlay() override;

	// Input Mapping Context
	UPROPERTY(EditAnywhere, BlueprintReadOnly, Category = Input)
	TSubclassOf<class UInputMappingContext> PlayerIMC;

	// Input Actions
	UPROPERTY(EditAnywhere, BlueprintReadOnly, Category = Input)
	class UInputAction* JumpAction;

	// Input functions
	void Jump();

public:
	// Called to bind functionality to input
	virtual void SetupInputComponent() override;
};