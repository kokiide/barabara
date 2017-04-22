//
//  GameViewController.swift
//  BarabaraGame
//
//  Created by Koki Ide on 2017/04/22.
//  Copyright © 2017 kokiide. All rights reserved.
//

import UIKit

class GameViewController: UITableViewController {

    @IBOutlet var imgView1: UIImageView! //upper photo
    @IBOutlet var imgView2: UIImageView! // mid photo
    @IBOutlet var imgView3: UIImageView! //bottom photo
    
    @IBOutlet var resultLabel: UILabel! //Label for the score
    
    var timer: Timer! //timer to move photo
    var score: Int = 1000 //score number
    let deafults: UserDefaults = UserDefaults.standard // var for score keeping purposes
    
    let width: CGFloat = UIScreen.main.bounds.size.width //screen width
    
    var positionX: [CGFloat] = [0.0, 0.0, 0.0] //photo position
    var dx:[CGFloat] = [1.0, 0.5, -1.0] //width range of photo movement
    
    func up(){
        for i in 0..<3 {
            //端にきたら動かす向きを逆に
            if positionX[i] > width || positionX[i] < 0 {
                dx[i] = dx[i] * (-1)
            }
            positionX[i] += dx[i] //画像の位置をdx分わけずらす
        }
        imgView1.center.x = positionX[0]
        imgView2.center.x = positionX[1]
    }
    func start() {
        resultLabel.isHidden = true
        
        timer = Timer.scheduledTimer(timeInterval: 0.005, target: self, selector: #selector(self.up), userInfo: nil, repeats: true)
        
        timer.fire()
    }
    
    @IBAction func stop(){
        if timer.isValid == true { //もしタイマーが動いていたら
            timer.invalidate() //タイマーをとめる
            
        }}
    
    override func viewDidLoad() {
        super.viewDidLoad()
        positionX = [width/2, width/2, width/2] //画像の位置を画面幅の中心にする
        self.start() //startというメソッドを呼び出す
        
        

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 0
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 0
    }

    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
