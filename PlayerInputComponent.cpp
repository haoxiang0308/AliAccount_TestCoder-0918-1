#include "PlayerInputComponent.h"
#include "GameFramework/Character.h"
#include "GameFramework/PlayerController.h"
#include "Components/InputComponent.h"

// Sets default values for this component's properties
UPlayerInputComponent::UPlayerInputComponent()
{
	// Set this component to be initialized when the game starts, and to be ticked every frame.
	PrimaryComponentTick.bCanEverTick = true;
}


// Called when the game starts
void UPlayerInputComponent::BeginPlay()
{
	Super::BeginPlay();
	
	// ...
	
}


// Called every frame
void UPlayerInputComponent::TickComponent(float DeltaTime, ELevelTick TickType, FActorComponentTickFunction* ThisTickFunction)
{
	Super::TickComponent(DeltaTime, TickType, ThisTickFunction);

	// ...
}

void UPlayerInputComponent::SetupPlayerInputComponent(UInputComponent* PlayerInputComponent, APlayerController* PlayerController)
{
	check(PlayerInputComponent);
	check(PlayerController);

	// Example: Bind action for moving forward
	PlayerInputComponent->BindAxis("MoveForward", this, &UPlayerInputComponent::MoveForward);

	// Example: Bind action for turning
	PlayerInputComponent->BindAxis("Turn", this, &UPlayerInputComponent::Turn);

	// Example: Bind action for jumping
	PlayerInputComponent->BindAction("Jump", IE_Pressed, this, &UPlayerInputComponent::Jump);
}

void UPlayerInputComponent::MoveForward(float Value)
{
	ACharacter* Character = Cast<ACharacter>(GetOwner());
	if (Character && Value != 0.0f)
	{
		// Add movement in the character's forward direction
		Character->AddMovementInput(Character->GetActorForwardVector(), Value);
	}
}

void UPlayerInputComponent::Turn(float Value)
{
	ACharacter* Character = Cast<ACharacter>(GetOwner());
	if (Character && Value != 0.0f)
	{
		// Add rotation input
		Character->AddControllerYawInput(Value);
	}
}

void UPlayerInputComponent::Jump()
{
	ACharacter* Character = Cast<ACharacter>(GetOwner());
	if (Character)
	{
		// Call the character's jump function
		Character->Jump();
	}
}