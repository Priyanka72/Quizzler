import Foundation

struct QuizBrain {
    let questions = [
        Question(question: "for the art historian, judgement involves making a decision about a work's importance in the history of art", answer:  "True"),
        Question(question: "lithography is a process in which the image is drawn on limestone, zinc, or aluminum with a special greasy crayon", answer: "True"), // true
        Question(question: "Form is a principle of art", answer: "False")// false
    ]
    
    var currQuestion = 0
    var numCorrectAns = 0
    
    mutating func checkAnswer( _ userAns: String) -> Bool {
        if userAns == questions[currQuestion].answer {
            // right
            numCorrectAns += 1
            return true
        }
        else {
            // wrong
            return false
        }
        
    }
    
    func getScore() -> Int {
        return numCorrectAns
    }
    
    func getQuestionText() -> String {
        return questions[currQuestion].question
    }
    
    func getProgress() -> Float {
        return  Float(currQuestion + 1)/Float(questions.count)
    }
    
    mutating func nextQuestion() {
        if currQuestion < questions.count - 1 {
            currQuestion += 1
        }
        else {
            currQuestion = 0
            numCorrectAns = 0
        }
    }
}
