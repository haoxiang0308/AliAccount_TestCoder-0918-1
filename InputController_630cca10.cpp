#include "PlayerInputHandler.h"
#include "EnhancedInputComponent.h"
#include "EnhancedInputSubsystems.h"
#include "InputAction.h"
#include "InputMappingContext.h"

APlayerInputHandler::APlayerInputHandler()
{
}

void APlayerInputHandler::BeginPlay()
{
    Super::BeginPlay();

    // Get the Enhanced Input Subsystem
    if (UEnhancedInputLocalPlayerSubsystem* Subsystem = ULocalPlayer::GetEnhancedInputSubsystem(GetLocalPlayer()))
    {
        // Add the input mapping context
        if (InputMappingContext)
        {
            Subsystem->AddMappingContext(InputMappingContext, 0);
        }
    }
}

void APlayerInputHandler::Tick(float DeltaTime)
{
    Super::Tick(DeltaTime);
}

void APlayerInputHandler::SetupInputComponent()
{
    Super::SetupInputComponent();

    // Set up input bindings
    if (UEnhancedInputComponent* EnhancedInputComponent = Cast<UEnhancedInputComponent>(InputComponent))
    {
        // Movement
        if (MoveForwardAction)
        {
            EnhancedInputComponent->BindAction(MoveForwardAction, ETriggerEvent::Triggered, this, &APlayerInputHandler::MoveForward);
        }
        if (MoveRightAction)
        {
            EnhancedInputComponent->BindAction(MoveRightAction, ETriggerEvent::Triggered, this, &APlayerInputHandler::MoveRight);
        }

        // Look
        if (LookUpAction)
        {
            EnhancedInputComponent->BindAction(LookUpAction, ETriggerEvent::Triggered, this, &APlayerInputHandler::LookUp);
        }
        if (TurnAction)
        {
            EnhancedInputComponent->BindAction(TurnAction, ETriggerEvent::Triggered, this, &APlayerInputHandler::Turn);
        }

        // Actions
        if (JumpAction)
        {
            EnhancedInputComponent->BindAction(JumpAction, ETriggerEvent::Started, this, &APlayerInputHandler::Jump);
        }
        if (FireAction)
        {
            EnhancedInputComponent->BindAction(FireAction, ETriggerEvent::Started, this, &APlayerInputHandler::Fire);
        }
    }
}

void APlayerInputHandler::MoveForward(float Value)
{
    // Add forward movement logic here
    if (Value != 0.0f)
    {
        AddMovementInput(GetActorForwardVector(), Value);
    }
}

void APlayerInputHandler::MoveRight(float Value)
{
    // Add right movement logic here
    if (Value != 0.0f)
    {
        AddMovementInput(GetActorRightVector(), Value);
    }
}

void APlayerInputHandler::LookUp(float Value)
{
    // Add look up/down logic here
    if (Value != 0.0f)
    {
        AddControllerPitchInput(Value);
    }
}

void APlayerInputHandler::Turn(float Value)
{
    // Add turn logic here
    if (Value != 0.0f)
    {
        AddControllerYawInput(Value);
    }
}

void APlayerInputHandler::Jump()
{
    // Add jump logic here
    APlayerController::Jump();
}

void APlayerInputHandler::Fire()
{
    // Add fire logic here
}