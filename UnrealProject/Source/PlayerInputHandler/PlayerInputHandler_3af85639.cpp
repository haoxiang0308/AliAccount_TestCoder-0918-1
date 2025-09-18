// PlayerInputHandler_3af85639.cpp
// A class to handle player input in Unreal Engine

#include "CoreMinimal.h"
#include "GameFramework/PlayerController.h"
#include "GameFramework/Character.h"
#include "GameFramework/CharacterMovementComponent.h"
#include "Components/InputComponent.h"

// Player input handler class
class PlayerInputHandler : public APlayerController
{
    GENERATED_BODY()

public:
    // Constructor
    PlayerInputHandler();

    // Called to bind functionality to input
    virtual void SetupInputComponent() override;

    // Input functions
    void MoveForward(float Value);
    void MoveRight(float Value);
    void Turn(float Rate);
    void LookUp(float Rate);
    void Jump();
    void StopJumping();

protected:
    // Reference to the controlled character
    ACharacter* ControlledCharacter;

    // Movement speed multiplier
    float MoveSpeedMultiplier;
};

// Constructor implementation
PlayerInputHandler::PlayerInputHandler()
{
    // Set default values
    MoveSpeedMultiplier = 1.0f;
}

// Setup input bindings
void PlayerInputHandler::SetupInputComponent()
{
    Super::SetupInputComponent();

    // Ensure we have a valid input component
    if (InputComponent)
    {
        // Movement bindings
        InputComponent->BindAxis("MoveForward", this, &PlayerInputHandler::MoveForward);
        InputComponent->BindAxis("MoveRight", this, &PlayerInputHandler::MoveRight);
        InputComponent->BindAxis("Turn", this, &PlayerInputHandler::Turn);
        InputComponent->BindAxis("LookUp", this, &PlayerInputHandler::LookUp);

        // Action bindings
        InputComponent->BindAction("Jump", IE_Pressed, this, &PlayerInputHandler::Jump);
        InputComponent->BindAction("Jump", IE_Released, this, &PlayerInputHandler::StopJumping);
    }
}

// Move forward/backward
void PlayerInputHandler::MoveForward(float Value)
{
    if (ControlledCharacter && Value != 0.0f)
    {
        // Get forward direction
        FRotator Rotation = ControlledCharacter->GetControlRotation();
        FRotator YawRotation(0, Rotation.Yaw, 0);

        // Get forward vector
        FVector Direction = FRotationMatrix(YawRotation).GetUnitAxis(EAxis::X);
        ControlledCharacter->AddMovementInput(Direction, Value * MoveSpeedMultiplier);
    }
}

// Move right/left
void PlayerInputHandler::MoveRight(float Value)
{
    if (ControlledCharacter && Value != 0.0f)
    {
        // Get right direction
        FRotator Rotation = ControlledCharacter->GetControlRotation();
        FRotator YawRotation(0, Rotation.Yaw, 0);

        // Get right vector
        FVector Direction = FRotationMatrix(YawRotation).GetUnitAxis(EAxis::Y);
        ControlledCharacter->AddMovementInput(Direction, Value * MoveSpeedMultiplier);
    }
}

// Turn (mouse X-axis)
void PlayerInputHandler::Turn(float Rate)
{
    if (ControlledCharacter && Rate != 0.0f)
    {
        ControlledCharacter->AddControllerYawInput(Rate);
    }
}

// Look up (mouse Y-axis)
void PlayerInputHandler::LookUp(float Rate)
{
    if (ControlledCharacter && Rate != 0.0f)
    {
        ControlledCharacter->AddControllerPitchInput(Rate);
    }
}

// Jump action
void PlayerInputHandler::Jump()
{
    if (ControlledCharacter)
    {
        ControlledCharacter->Jump();
    }
}

// Stop jumping
void PlayerInputHandler::StopJumping()
{
    if (ControlledCharacter)
    {
        ControlledCharacter->StopJumping();
    }
}