class BaseballGame {
    var randomNumber: Int
    
    init() {
        let randomNumberGenerator = RandomNumberGenerator()
        self.randomNumber = randomNumberGenerator.generateUniqueThreeDigitNumber()
    }
    
    func start() {
        print("< 게임을 시작합니다 >")
        print("숫자를 입력하세요")
        while true {
            guard let input = readLine(), let guessedNumber = Int(input) else {
                print("올바른 값이 아닙니다")
                continue
            }
            guard guessedNumber > 100 else {
                print("100보다 큰 수를 입력해야 합니다.")
                continue
            }
            guard guessedNumber < 1000 else {
                print("1000보다 작은 수를 입력해야 합니다.")
                continue
            }
            print("입력한 숫자: \(guessedNumber)")
            print("생성된 숫자: \(randomNumber)")
            
            let result : (strike: Int, ball: Int) = matchNumber(guessedNumber,randomNumber)
            
            print("\(result.strike)스트라이크 \(result.ball)볼")
            
            if(guessedNumber == randomNumber){
                print("정답입니다!")
                break
            }
        }
    }
    
    func matchNumber(_ guessedNumber:Int ,_ randomNumber:Int) -> (strike: Int, ball: Int) {
        let guessedNumberString = String(guessedNumber)
        let randomNumberString = String(randomNumber)
        
        var strike:Int = 0
        var ball:Int = 0
        
        for i in 0...2 {
            //한 글자를 저장
            //            let guessedDigit = guessedNumberString[guessedNumberString.index(guessedNumberString.startIndex, offsetBy: i)]
            //            let randomDigit = randomNumberString[randomNumberString.index(randomNumberString.startIndex, offsetBy: i)]
            //배열로 전체를 저장
            let guessedDigit = Array(guessedNumberString)
            let randomDigit = Array(randomNumberString)
            
            print(guessedDigit[i])
            print(randomDigit[i])
            print(guessedDigit[i]==randomDigit[i])
            print(randomNumberString.contains(guessedDigit[i]))
            
            if(guessedDigit[i] == randomDigit[i]) {
                strike += 1
            } else if(randomNumberString.contains(guessedDigit[i])) {
                ball += 1
            }
        }
        
        return (strike, ball)
    }
}
