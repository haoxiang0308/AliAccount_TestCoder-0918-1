#pragma once

#include "CoreMinimal.h"
#include "Components/ActorComponent.h"
#include "PlayerInputComponent.generated.h"


UCLASS( ClassGroup=(Custom), meta=(BlueprintSpawnableComponent) )
class SNAKEGAME_API UPlayerInputComponent : public UActorComponent
{
	GENERATED_BODY()

public:
	// Sets default values for this component's properties
	UPlayerInputComponent();

protected:
	// Called when the game starts
	virtual void BeginPlay() override;

public:
	// Called every frame
	virtual void TickComponent(float DeltaTime, ELevelTick TickType, FActorComponentTickFunction* ThisTickFunction) override;

	// Function to bind input actions/axes, typically called by the owning Character
	void SetupPlayerInputComponent(class UInputComponent* PlayerInputComponent);

	// Input callback functions
	void MoveForward(float Value);
	void MoveRight(float Value);
	void Jump();
	void StopJumping();
};