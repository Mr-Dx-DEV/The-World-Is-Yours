local Translations = {
    email = {
        sender = "Jane Doe",
        subject = "Boosting",
        contract_given = "Wassup pussy, I sent over a contract, check your laptop.",
        contract_accepted = "So you finally decided to respond to me. Alright well hold on I'm sending over the details, it might be a min",
        vehicle_spawned = "Alright the details have been sent. Check your GPS for a general location of the vehicle, I couldn't pin it down exactly",
        dropOff_wait = "Good work on securing the vehicle. Please wait while I send over the drop off location.",
        dropOff_sent = "Ok check your GPS for the location of the drop off. Just drop the car off in the area and leave. Make sure no one follows you",
        dropOff_leaveArea = "Okay now get the fuck out of there, and make sure no one saw you.",
        dropOff_collected = "Well looks like that's it for this one. I've collected the vehicle and sent over the QBits to your address. HMU for more work in the future",
        scratchLocation_wait = "Hold up while I send you the location to scratch the VIN. This might take a min or two",
        scratchLocation_sent = "Alright pal check your GPS I sent over the location",
        scratchInfo = "Alright now that you are at the location, you can go ahead and scratch off the VIN",
        scratched = "Good shit, you scratched the VIN. The car is now yours and the contract is complete.",
        damaged = "Try not to damage the vehicle, I'm going to have to reduce your pay because of that. Keep it up and you'll get payed nothing.",
    },
    info = {
        tracker = "Disable the Tracker",
        tracker_removed = "Tracker Disabled",
        tracker_failed = "Failed to Disable Tracker",
        tracker_again = "The tracker needs to be hacked again",
        tracker_wait = "The tracker is on cooldown, wait",
        received_qbit = "You have received QBit(s)",
        scratch = "Scratch the VIN",
        notInLocation = "Cannot Scratch Here",
        exitVehicle = "Exit the Vehicle",
        received_reward = "Car Boosted",
        received_item = "Item Received",
    },
    objective = {
        break_in = "Locate the vehicle and break in",
        remove_tracker = "Disable the GPS tracker",
        drop_off = "Drop off the vehicle",
        scratch_area = "Drive to the VIN scratch area",
        scratch = "Scratch off the VIN number",
        leave_area = "Leave the area",
    }
}

Lang = Lang or Locale:new({
    phrases = Translations,
    warnOnMissing = true
})