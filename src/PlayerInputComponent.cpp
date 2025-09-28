// Fill out your copyright notice in the Description page of Project Settings.

#include "PlayerInputComponent.h"
#include "EnhancedInputComponent.h"
#include "EnhancedInputSubsystems.h"
#include "InputAction.h"
#include "Engine/LocalPlayer.h"

// Sets default values for this component's properties
UPlayerInputComponent::UPlayerInputComponent()
{
	// Set this component to be initialized when the game starts, and to be ticked every frame.  You can turn these features
	// off to improve performance if you don't need them.
	PrimaryComponentTick.bCanEverTick = true;
}


// Called when the game starts
void UPlayerInputComponent::BeginPlay()
{
	Super::BeginPlay();

	// Get the Enhanced Input Subsystem
	if (APlayerController* PlayerController = Cast<APlayerController>(GetOwner()))
	{
		if (UEnhancedInputLocalPlayerSubsystem* Subsystem = ULocalPlayer::GetSubsystem<UEnhancedInputLocalPlayerSubsystem>(PlayerController->GetLocalPlayer()))
		{
			// Add the mapping context so we get notifications of input
			Subsystem->AddMappingContext(InputMappingContext, 0);
		}
	}
	
}


// Called every frame
void UPlayerInputComponent::TickComponent(float DeltaTime, ELevelTick TickType, FActorComponentTickFunction* ThisTickFunction)
{
	Super::TickComponent(DeltaTime, TickType, ThisTickFunction);

	// ...
}

void UPlayerInputComponent::SetupInputBindings(UInputMappingContext* InMappingContext, UInputAction* InInputAction_Move, UInputAction* InInputAction_Look, UInputAction* InInputAction_Jump)
{
	InputMappingContext = InMappingContext;

	if (APlayerController* PlayerController = Cast<APlayerController>(GetOwner()))
	{
		if (UEnhancedInputComponent* EnhancedInputComponent = Cast<UEnhancedInputComponent>(PlayerController->InputComponent))
		{
			// Clear any previous bindings
			EnhancedInputComponent->ClearActionBindings();

			// Bind the actions
			EnhancedInputComponent->BindAction(InInputAction_Move, ETriggerEvent::Triggered, this, &UPlayerInputComponent::Move);
			EnhancedInputComponent->BindAction(InInputAction_Look, ETriggerEvent::Triggered, this, &UPlayerInputComponent::Look);
			EnhancedInputComponent->BindAction(InInputAction_Jump, ETriggerEvent::Started, this, &UPlayerInputComponent::Jump);
		}
	}
}

void UPlayerInputComponent::Move(const FInputActionValue& Value)
{
	// Input is a Vector2D
	FVector2D MovementVector = Value.Get<FVector2D>();

	// Add movement to the player character
	if (APawn* ControlledPawn = GetOwner()->GetPawn())
	{
		ControlledPawn->AddMovementInput(FRotationMatrix(FRotator(0.0f, GetOwner()->GetControlRotation().Yaw, 0.0f)).GetUnitAxis(EAxis::X), MovementVector.X);
		ControlledPawn->AddMovementInput(FRotationMatrix(FRotator(0.0f, GetOwner()->GetControlRotation().Yaw, 0.0f)).GetUnitAxis(EAxis::Y), MovementVector.Y);
	}
}

void UPlayerInputComponent::Look(const FInputActionValue& Value)
{
	// Input is a Vector2D
	FVector2D LookAxisVector = Value.Get<FVector2D>();

	if (APawn* ControlledPawn = GetOwner()->GetPawn())
	{
		ControlledPawn->AddControllerYawInput(LookAxisVector.X);
		ControlledPawn->AddControllerPitchInput(LookAxisVector.Y);
	}
}

void UPlayerInputComponent::Jump(const FInputActionValue& Value)
{
	if (ACharacter* Character = Cast<ACharacter>(GetOwner()->GetPawn()))
	{
		Character->Jump();
	}
}