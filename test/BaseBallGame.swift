class BaseballGame {
    var randomNumber: Int
    let recordManager = RecordManager()
    
    init() {
        let randomNumberGenerator = RandomNumberGenerator()
        self.randomNumber = randomNumberGenerator.generateUniqueThreeDigitNumber()
    }
    
    func intro() {
        while true {
            print("환영합니다! 원하시는 번호를 입력해주세요")
            print("1. 게임 시작하기  2. 게임 기록 보기  3. 종료하기")
            guard let input = readLine(), //입력받기
                  let guessedNumber = Int(input) //숫자로 변환
            else {
                print("잘못 입력했습니다.\n")
                continue
            }
            switch guessedNumber{
            case 1:
                start()
            case 2:
                recordManager.show()
            case 3:
                print("게임을 종료합니다.")
                exit(0)
            default:
                print("잘못 입력했습니다.\n")
            }
            
        }
    }
    
    func start() {
        var trialCount = 0
        
        print("< 게임을 시작합니다 >")
        print("숫자를 입력하세요")
        while true {
            guard let input = readLine(), //입력받기
                  let guessedNumber = Int(input), //숫자로 변환
                  input.count == 3, //3자리 수 입력
                  hasUniqueDigits(input) //각 자리가 다른 숫자인지 확인
            else {
                print("각 자리수가 다른 세자리 숫자만 입력 가능합니다.\n")
                continue
            }
            print("입력한 숫자: \(guessedNumber)")
            print("생성된 숫자: \(randomNumber)")
            
            let result : (strike: Int, ball: Int) = matchNumber(guessedNumber,randomNumber)
            
            if(result.strike==0 && result.ball==0){
                print("Nothing")
            } else if(result.ball==0){
                print("\(result.strike)스트라이크")
            } else if(result.strike==0){
                print("\(result.ball)볼")
            } else {
                print("\(result.strike)스트라이크 \(result.ball)볼")
            }
            
            print("")
            trialCount += 1 // 횟수 시도 추가
            
            if(guessedNumber == randomNumber){
                print("정답입니다!")
                recordManager.add(trialCount: trialCount)
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
            //배열로 전체를 저장
            let guessedDigit = Array(guessedNumberString)
            let randomDigit = Array(randomNumberString)
            
            if(guessedDigit[i] == randomDigit[i]) {
                strike += 1
            } else if(randomNumberString.contains(guessedDigit[i])) {
                ball += 1
            }
        }
        
        return (strike, ball)
    }
    
    func hasUniqueDigits(_ input: String) -> Bool {
        let inputArray = Array(input)
        if(inputArray[0]=="0"){ //0으로 시작하는 숫자 입력 방지
            return false
        }
        let uniqueDigits = Set(inputArray)
        return uniqueDigits.count == inputArray.count
    }
}
