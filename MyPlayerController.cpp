// Fill out your copyright notice in the Description page of Project Settings.

#include "MyPlayerController.h"


AMyPlayerController::AMyPlayerController()
{
	// Enable ticking
	PrimaryActorTick.bCanEverTick = true;

	// Bind input mapping functions
	static ConstructorHelpers::FObjectFinder<UInputAction> InputActionJump(TEXT("/Game/Input/IA_Jump"));
	if (InputActionJump.Succeeded())
	{
		JumpAction = InputActionJump.Object;
	}

	// Add Input Mapping Context
	static ConstructorHelpers::FClassFinder<UInputMappingContext> InputMappingContext(TEXT("/Game/Input/IMC_Player"));
	if (InputMappingContext.Succeeded())
	{
		PlayerIMC = InputMappingContext.Class;
	}
}

void AMyPlayerController::BeginPlay()
{
	Super::BeginPlay();

	// Try to add the input mapping context
	if (UEnhancedInputLocalPlayerSubsystem* Subsystem = ULocalPlayer::GetSubsystem<UEnhancedInputLocalPlayerSubsystem>(GetLocalPlayer()))
	{
		Subsystem->AddMappingContext(PlayerIMC->GetDefaultObject<UInputMappingContext>(), 0);
	}
}

void AMyPlayerController::SetupInputComponent()
{
	Super::SetupInputComponent();

	// Bind actions
	if (UEnhancedInputComponent* EnhancedInputComponent = Cast<UEnhancedInputComponent>(InputComponent))
	{
		EnhancedInputComponent->BindAction(JumpAction, ETriggerEvent::Triggered, this, &AMyPlayerController::Jump);
	}
}

void AMyPlayerController::Jump()
{
	// Handle jump input
	// Add your jump logic here
}