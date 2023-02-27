package hamming

import (
	"errors"
)

func Distance(a, b string) (distance int, e error) {
	if len(a) != len(b) {
		return 0, errors.New("Strings must be of equal length")
	}
	//var distance int // can be omitted since we use named return values
	//distance = 0
	for index := range a {
		if a[index] != b[index] {
			distance++
		}
	}

	return distance, nil
}
