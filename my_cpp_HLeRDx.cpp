#include "MyPlayerController.h"
#include "EnhancedInputComponent.h"
#include "EnhancedInputSubsystems.h"

AMyPlayerController::AMyPlayerController()
{
bRepInputVCSkinny = true;
bEnableTouchEvents = true;
bEnableClickEvents = true;
bEnableMouseOverEvents = true;
bEnableTouchOverEvents = true;
}

void AMyPlayerController::BeginPlay()
{
Super::BeginPlay();

if (UEnhancedInputLocalPlayerSubsystem* Subsystem = ULocalPlayer::GetSubsystem<UEnhancedInputLocalPlayerSubsystem>(GetLocalPlayer()))
{
Subsystem->AddMappingContext(DefaultMappingContext, 0);
}
}

void AMyPlayerController::SetupInputComponent()
{
Super::SetupInputComponent();

if (UEnhancedInputComponent* EnhancedInputComponent = Cast<UEnhancedInputComponent>(InputComponent))
{
EnhancedInputComponent->BindAction(MoveAction, ETriggerEvent::Triggered, this, &AMyPlayerController::Move);
EnhancedInputComponent->BindAction(LookAction, ETriggerEvent::Triggered, this, &AMyPlayerController::Look);
EnhancedInputComponent->BindAction(JumpAction, ETriggerEvent::Started, this, &AMyPlayerController::Jump);
EnhancedInputComponent->BindAction(JumpAction, ETriggerEvent::Completed, this, &AMyPlayerController::StopJump);
}
}

void AMyPlayerController::Move(const FInputActionValue& Value)
{
FVector2D MovementVector = Value.Get<FVector2D>();

if (APawn* ControlledPawn = GetPawn())
{
FRotator Rotation = ControlledPawn->GetViewRotation();
FRotator YawRotation(0, Rotation.Yaw, 0);

FVector ForwardDirection = FRotationMatrix(YawRotation).GetUnitAxis(EAxis::X);
FVector RightDirection = FRotationMatrix(YawRotation).GetUnitAxis(EAxis::Y);

AddMovementInput(ForwardDirection, MovementVector.Y);
AddMovementInput(RightDirection, MovementVector.X);
}
}

void AMyPlayerController::Look(const FInputActionValue& Value)
{
FVector2D LookAxisVector = Value.Get<FVector2D>();

if (APawn* ControlledPawn = GetPawn())
{
AddControllerInput(0, LookAxisVector.X);
AddControllerInput(1, LookAxisVector.Y);
}
}

void AMyPlayerController::Jump()
{
if (APawn* ControlledPawn = GetPawn())
{
ControlledPawn->Jump();
}
}

void AMyPlayerController::StopJump()
{
if (APawn* ControlledPawn = GetPawn())
{
ControlledPawn->StopJumping();
}
}
