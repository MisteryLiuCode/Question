//
//  ViewController.swift
//  Question
//
//  Created by 刘军 on 2021/11/2.
//

import UIKit

//controller--业务逻辑
class ViewController: UIViewController {
    
    var currentQuestionIndex = 0
    var score = 0
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var progressLabel: UILabel!
    @IBOutlet weak var progressBarViewWidth: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        questionLabel.text = questions[0].text
    }

    @IBAction func answerPressed(_ sender: UIButton){
        checkAnswer(sender.tag) //判断用户是否回答正确,给出相应的提示框,并在回答正确时加1分
        
        currentQuestionIndex += 1 //本项目重点数据,当前问题所在的下标(索引)
        
        nextQuestion() //展示下一个问题,并在到达最后一问时处理相关数据和视图
        
        updateProgress() //更新问题序号和黄色进度条
    }
    
    func checkAnswer(_ tag: Int){
        if tag == 1{
            if questions[currentQuestionIndex].answer{
                ProgressHUD.showSuccess("答对了") //类方法,直接用类名调用即可,后述
                score += 1
                updateScoreLabel()
            }else{
                ProgressHUD.showError("答错了")
            }
        }else{
            if questions[currentQuestionIndex].answer{
                ProgressHUD.showError("答错了")
            }else{
                ProgressHUD.showSuccess("答对了")
                score += 1
                updateScoreLabel()
            }
        }
    }
    
    func nextQuestion(){
        if currentQuestionIndex <= 12{
            updateQuestionText()
        }else{
            //reset
            currentQuestionIndex = 0
            score = 0
            
            //handler和completion参数为闭包/回调函数,一般用在一怎么怎么就怎么怎么
            let alert = UIAlertController(title: "漂亮!", message: "您已经完成了所有问题,要重新来一遍吗?", preferredStyle: .alert)
            //alert下面的按钮
            let action = UIAlertAction(title: "再来一遍", style: .default, handler: { _ in
                self.updateQuestionText()
                self.updateScoreLabel()
            })
            //把按钮添加到alert页面上去
            alert.addAction(action)
            //UIAlertController为UIViewController的子类,可以使用,后述
            present(alert, animated: true)
        }
    }
    
    func updateQuestionText(){
        questionLabel.text = questions[currentQuestionIndex].text
    }
    
    func updateScoreLabel(){
        scoreLabel.text = "总得分: \(score)"
    }
    
    func updateProgress(){
        progressLabel.text = "\(currentQuestionIndex + 1) / 13"
        
        progressBarViewWidth.constant = (view.frame.width / 13) * CGFloat(currentQuestionIndex)
    }
    

}

