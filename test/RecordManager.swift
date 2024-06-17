class RecordManager{
    var history = [Int:Int]()
    var gameCount = 0 //총 게임 횟수
    
    func add(trialCount:Int){
        gameCount += 1 //게임 횟수 추가
        history[gameCount] = trialCount
    }
    func show(){
        print("< 게임 기록 보기 >")
        if (history.isEmpty){
            print("게임 기록이 없습니다.")
        } else {
            for game in history {
                print("\(game.key)번째 게임 : 시도 횟수 - \(game.value)")
            }
        }
        
    }
}
