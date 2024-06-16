class RandomNumberGenerator {
    func generateUniqueThreeDigitNumber() -> Int {
        var numberSet: Set<Int> = []
        while numberSet.count < 3 {
            numberSet.insert(Int.random(in: 0...9))
        }
        let numberArray = Array(numberSet)
        
        if numberArray[0] == 0 {
            return generateUniqueThreeDigitNumber()
        }
        
        let number = (numberArray[0] * 100) + (numberArray[1] * 10) + numberArray[2]
        
        return number
    }
}
