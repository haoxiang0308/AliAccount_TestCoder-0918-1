// PlayerInputHandler_caeeb74340.cpp
// Implementation of player input handling for Unreal Engine

#include "CoreMinimal.h"
#include "GameFramework/Pawn.h"
#include "GameFramework/PlayerController.h"
#include "GameFramework/Character.h"
#include "GameFramework/CharacterMovementComponent.h"
#include "Components/InputComponent.h"
#include "EnhancedInputComponent.h"
#include "EnhancedInputSubsystems.h"
#include "InputAction.h"
#include "InputMappingContext.h"
#include "Engine/World.h"

// Player input handler class
class PlayerInputHandler
{
public:
    // Constructor
    PlayerInputHandler();
    
    // Destructor
    ~PlayerInputHandler();
    
    // Setup input bindings
    void SetupInputBindings(UInputComponent* PlayerInputComponent);
    
    // Input action handlers
    void MoveForward(float Value);
    void MoveRight(float Value);
    void Turn(float Value);
    void LookUp(float Value);
    void Jump();
    void StopJumping();
    void SprintStart();
    void SprintStop();
    
private:
    // Reference to the controlled pawn/character
    APawn* ControlledPawn;
    
    // Movement speed multiplier
    float MovementSpeed;
    
    // Sprint speed multiplier
    float SprintSpeedMultiplier;
};

// Implementation
PlayerInputHandler::PlayerInputHandler() 
    : MovementSpeed(1.0f), SprintSpeedMultiplier(2.0f)
{
    // Initialize with default values
}

PlayerInputHandler::~PlayerInputHandler()
{
    // Cleanup if needed
}

void PlayerInputHandler::SetupInputBindings(UInputComponent* PlayerInputComponent)
{
    // Check if we're using enhanced input or legacy input
    if (UEnhancedInputComponent* EnhancedInputComponent = CastChecked<UEnhancedInputComponent>(PlayerInputComponent))
    {
        // Bind enhanced input actions (this would require InputAction assets)
        // EnhancedInputComponent->BindAction(MoveForwardAction, ETriggerEvent::Triggered, this, &PlayerInputHandler::MoveForward);
    }
    else
    {
        // Bind legacy input
        PlayerInputComponent->BindAxis("MoveForward", this, &PlayerInputHandler::MoveForward);
        PlayerInputComponent->BindAxis("MoveRight", this, &PlayerInputHandler::MoveRight);
        PlayerInputComponent->BindAxis("Turn", this, &PlayerInputHandler::Turn);
        PlayerInputComponent->BindAxis("LookUp", this, &PlayerInputHandler::LookUp);
        
        PlayerInputComponent->BindAction("Jump", IE_Pressed, this, &PlayerInputHandler::Jump);
        PlayerInputComponent->BindAction("Jump", IE_Released, this, &PlayerInputHandler::StopJumping);
        PlayerInputComponent->BindAction("Sprint", IE_Pressed, this, &PlayerInputHandler::SprintStart);
        PlayerInputComponent->BindAction("Sprint", IE_Released, this, &PlayerInputHandler::SprintStop);
    }
}

void PlayerInputHandler::MoveForward(float Value)
{
    if (ControlledPawn && Value != 0.0f)
    {
        // Find forward direction
        const FRotator Rotation = ControlledPawn->GetControlRotation();
        const FRotator YawRotation(0, Rotation.Yaw, 0);
        
        // Get forward vector
        const FVector Direction = FRotationMatrix(YawRotation).GetUnitAxis(EAxis::X);
        
        // Apply movement
        ControlledPawn->AddMovementInput(Direction, Value * MovementSpeed);
    }
}

void PlayerInputHandler::MoveRight(float Value)
{
    if (ControlledPawn && Value != 0.0f)
    {
        // Find right direction
        const FRotator Rotation = ControlledPawn->GetControlRotation();
        const FRotator YawRotation(0, Rotation.Yaw, 0);
        
        // Get right vector
        const FVector Direction = FRotationMatrix(YawRotation).GetUnitAxis(EAxis::Y);
        
        // Apply movement
        ControlledPawn->AddMovementInput(Direction, Value * MovementSpeed);
    }
}

void PlayerInputHandler::Turn(float Value)
{
    if (ControlledPawn && Value != 0.0f)
    {
        ControlledPawn->AddControllerYawInput(Value);
    }
}

void PlayerInputHandler::LookUp(float Value)
{
    if (ControlledPawn && Value != 0.0f)
    {
        ControlledPawn->AddControllerPitchInput(Value);
    }
}

void PlayerInputHandler::Jump()
{
    if (ACharacter* Character = Cast<ACharacter>(ControlledPawn))
    {
        Character->Jump();
    }
}

void PlayerInputHandler::StopJumping()
{
    if (ACharacter* Character = Cast<ACharacter>(ControlledPawn))
    {
        Character->StopJumping();
    }
}

void PlayerInputHandler::SprintStart()
{
    MovementSpeed *= SprintSpeedMultiplier;
}

void PlayerInputHandler::SprintStop()
{
    MovementSpeed /= SprintSpeedMultiplier;
}