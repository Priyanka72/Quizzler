import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var trueButton: UIButton!
    @IBOutlet weak var falseButton: UIButton!
    
    @IBOutlet weak var score: UILabel!
    
    var quizBrain = QuizBrain().self

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        updateUI()
    }


    @IBAction func answerButtonPressed(_ sender: UIButton) {
        let userAnswer = sender.currentTitle!
        let userResult = quizBrain.checkAnswer(userAnswer)
        
        if userResult {
            // print("right")
            sender.backgroundColor = UIColor.green
        }
        else {
            // print("wrong")
            sender.backgroundColor = UIColor.red
        }
        
        quizBrain.nextQuestion()
        
        Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)
        // updateUI()
    }
    
    @objc func updateUI(){
        // print(currQuestion)
        // print(questions.count)
        questionLabel.text = quizBrain.getQuestionText()
        trueButton.backgroundColor = UIColor.clear
        falseButton.backgroundColor = UIColor.clear
        score.text = "Score: \(quizBrain.getScore())"
        progressBar.progress = quizBrain.getProgress()
        //questionLabel.text = "Congratulations you're done"
       
    }
    
}

