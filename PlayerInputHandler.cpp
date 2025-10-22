#include "PlayerInputHandler.h"
#include "EnhancedInputComponent.h"
#include "EnhancedInputSubsystems.h"
#include "InputActionValue.h"

// Sets default values
APlayerInputHandler::APlayerInputHandler()
{
 	// Set this character to call Tick() every frame.  You can turn this off to improve performance if you don't need it.
	PrimaryActorTick.bCanEverTick = true;
}

// Called when the game starts or when spawned
void APlayerInputHandler::BeginPlay()
{
	Super::BeginPlay();
	
	// Add input mapping
	if (APlayerController* PlayerController = Cast<APlayerController>(Controller))
	{
		if (UEnhancedInputLocalPlayerSubsystem* Subsystem = ULocalPlayer::GetSubsystem<UEnhancedInputLocalPlayerSubsystem>(PlayerController->GetLocalPlayer()))
		{
			Subsystem->AddMappingContext(DefaultMappingContext, 0);
		}
	}
}

// Called every frame
void APlayerInputHandler::Tick(float DeltaTime)
{
	Super::Tick(DeltaTime);
}

// Called to bind functionality to input
void APlayerInputHandler::SetupPlayerInputComponent(UInputComponent* PlayerInputComponent)
{
	// Set up action bindings
	if (UEnhancedInputComponent* EnhancedInputComponent = Cast<UEnhancedInputComponent>(PlayerInputComponent))
	{
		// Jumping
		EnhancedInputComponent->BindAction(JumpActionInput, ETriggerEvent::Started, this, &APlayerInputHandler::JumpAction);

		// Moving
		EnhancedInputComponent->BindAction(MoveForwardAction, ETriggerEvent::Triggered, this, &APlayerInputHandler::MoveForward);
		EnhancedInputComponent->BindAction(MoveRightAction, ETriggerEvent::Triggered, this, &APlayerInputHandler::MoveRight);

		// Looking
		EnhancedInputComponent->BindAction(LookUpAction, ETriggerEvent::Triggered, this, &APlayerInputHandler::LookUp);
		EnhancedInputComponent->BindAction(TurnAction, ETriggerEvent::Triggered, this, &APlayerInputHandler::Turn);
		
		// Fire
		EnhancedInputComponent->BindAction(FireActionInput, ETriggerEvent::Started, this, &APlayerInputHandler::FireAction);
	}
}

void APlayerInputHandler::MoveForward(float Value)
{
	if (Controller != nullptr)
	{
		// Find out which way is forward
		const FRotator Rotation = Controller->GetControlRotation();
		const FRotator YawRotation(0, Rotation.Yaw, 0);

		// Get forward vector
		const FVector ForwardDirection = FRotationMatrix(YawRotation).GetUnitAxis(EAxis::X);
	
		// Add movement in that direction
		AddMovementInput(ForwardDirection, Value);
	}
}

void APlayerInputHandler::MoveRight(float Value)
{
	if (Controller != nullptr)
	{
		// Find out which way is right
		const FRotator Rotation = Controller->GetControlRotation();
		const FRotator YawRotation(0, Rotation.Yaw, 0);
	
		// Get right vector 
		const FVector RightDirection = FRotationMatrix(YawRotation).GetUnitAxis(EAxis::Y);
	
		// Add movement in that direction
		AddMovementInput(RightDirection, Value);
	}
}

void APlayerInputHandler::LookUp(float Value)
{
	AddControllerPitchInput(Value);
}

void APlayerInputHandler::Turn(float Value)
{
	AddControllerYawInput(Value);
}

void APlayerInputHandler::JumpAction()
{
	Jump();
}

void APlayerInputHandler::FireAction()
{
	// Add firing logic here
	// For example, trigger weapon firing, special ability, etc.
}