package utils

import (
	"math/rand"
	"strconv"
	"time"
)

// bank_heist

func Play() string {
	rand.Seed(time.Now().UnixNano())
	isHeistOn := true
	eludedGuards := rand.Intn(100)
	if eludedGuards >= 50 && isHeistOn == true {
		message := "Looks like you've managed to make it past the guards. Good job, but remember, this is the first step."
		reportGuards := strconv.Itoa(eludedGuards)
		text := "eludedGuards has a value of "
		report := text + reportGuards
		result := message + report

		return result
	} else {
		result := "Better Luck next time"
		return result
	}
}
