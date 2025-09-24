#include "MyPlayerController.h"
#include "EnhancedInputComponent.h"
#include "EnhancedInputSubsystems.h"

void AMyPlayerController::SetupInputComponent()
{
    Super::SetupInputComponent();

    if (UEnhancedInputLocalPlayerSubsystem* Subsystem = ULocalPlayer::GetSubsystem<UEnhancedInputLocalPlayerSubsystem>(GetLocalPlayer()))
    {
        Subsystem->AddMappingContext(DefaultMappingContext, 0);
    }

    if (UEnhancedInputComponent* EnhancedInputComponent = Cast<UEnhancedInputComponent>(InputComponent))
    {
        EnhancedInputComponent->BindAction(MoveForwardAction, ETriggerEvent::Triggered, this, &AMyPlayerController::MoveForward);
        EnhancedInputComponent->BindAction(MoveRightAction, ETriggerEvent::Triggered, this, &AMyPlayerController::MoveRight);
        EnhancedInputComponent->BindAction(LookUpAction, ETriggerEvent::Triggered, this, &AMyPlayerController::LookUp);
        EnhancedInputComponent->BindAction(TurnAction, ETriggerEvent::Triggered, this, &AMyPlayerController::Turn);
        EnhancedInputComponent->BindAction(JumpAction, ETriggerEvent::Started, this, &AMyPlayerController::Jump);
    }
}

void AMyPlayerController::MoveForward(float Value)
{
    // Add forward movement logic here
}

void AMyPlayerController::MoveRight(float Value)
{
    // Add right movement logic here
}

void AMyPlayerController::LookUp(float Value)
{
    // Add look up/down logic here
}

void AMyPlayerController::Turn(float Value)
{
    // Add turn logic here
}

void AMyPlayerController::Jump()
{
    // Add jump logic here
}