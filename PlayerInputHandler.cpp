#include "PlayerInputHandler.h"
#include "Components/InputComponent.h"
#include "Engine/World.h"

// Sets default values
APlayerInputHandler::APlayerInputHandler()
{
 	// Set this character to call Tick() every frame.  You can turn this off to improve performance if you don't need it.
	PrimaryActorTick.bCanEverTick = true;

	// Create a camera boom (pulls in towards the player if there is a collision)
	CameraBoom = CreateDefaultSubobject<USpringArmComponent>(TEXT("CameraBoom"));
	CameraBoom->SetupAttachment(RootComponent);
	CameraBoom->bUsePawnControlRotation = true; // Rotate the arm based on the controller

	// Create a follow camera
	FollowCamera = CreateDefaultSubobject<UCameraComponent>(TEXT("FollowCamera"));
	FollowCamera->SetupAttachment(CameraBoom, USpringArmComponent::SocketName);
	FollowCamera->bUsePawnControlRotation = false; // Camera does not rotate relative to arm

	// Set movement speeds
	ForwardMoveSpeed = 1.0f;
	RightMoveSpeed = 1.0f;
	LookUpSpeed = 1.0f;
	TurnSpeed = 1.0f;
}

// Called when the game starts or when spawned
void APlayerInputHandler::BeginPlay()
{
	Super::BeginPlay();
}

// Called every frame
void APlayerInputHandler::Tick(float DeltaTime)
{
	Super::Tick(DeltaTime);
}

// Called to bind functionality to input
void APlayerInputHandler::SetupPlayerInputComponent(UInputComponent* PlayerInputComponent)
{
	Super::SetupPlayerInputComponent(PlayerInputComponent);

	// Bind movement events
	PlayerInputComponent->BindAxis("MoveForward", this, &APlayerInputHandler::MoveForward);
	PlayerInputComponent->BindAxis("MoveRight", this, &APlayerInputHandler::MoveRight);

	// Bind look events
	PlayerInputComponent->BindAxis("LookUp", this, &APlayerInputHandler::LookUp);
	PlayerInputComponent->BindAxis("Turn", this, &APlayerInputHandler::Turn);

	// Bind action events
	PlayerInputComponent->BindAction("Jump", IE_Pressed, this, &APlayerInputHandler::JumpAction);
	PlayerInputComponent->BindAction("Fire", IE_Pressed, this, &APlayerInputHandler::FireAction);
}

// Movement functions
void APlayerInputHandler::MoveForward(float Value)
{
	if (Value != 0.0f)
	{
		AddMovementInput(GetActorForwardVector(), Value * ForwardMoveSpeed);
	}
}

void APlayerInputHandler::MoveRight(float Value)
{
	if (Value != 0.0f)
	{
		AddMovementInput(GetActorRightVector(), Value * RightMoveSpeed);
	}
}

// Look functions
void APlayerInputHandler::LookUp(float Value)
{
	if (Value != 0.0f)
	{
		AddControllerPitchInput(Value * LookUpSpeed);
	}
}

void APlayerInputHandler::Turn(float Value)
{
	if (Value != 0.0f)
	{
		AddControllerYawInput(Value * TurnSpeed);
	}
}

// Action functions
void APlayerInputHandler::JumpAction()
{
	Jump();
}

void APlayerInputHandler::FireAction()
{
	// Add firing logic here
	UE_LOG(LogTemp, Warning, TEXT("Fire action triggered!"));
}