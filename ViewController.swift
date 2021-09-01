//
//  ViewController.swift
//  myMusic
//
//  Created by Mahesh on 07/08/20.
//  Copyright © 2020 Mahesh. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
   
    var Songs = [Song]()
    
    @IBOutlet var tblView : UITableView?
    override func viewDidLoad() {
        super.viewDidLoad()
        tblView?.delegate = self
        tblView?.dataSource = self
        configureSongs()
        // Do any additional setup after loading the view.
    }
    func configureSongs() {
        Songs.append(Song(name: "SAKHIYAN",
                          albumname: "Panjabi-Album",
                          imageName: "Sakhiyan",
                          artistName: "Maninder Buttar",
                          trackName: "Sakhiyan"))
        Songs.append(Song(name: "MEMORIES",
                          albumname: "HollyWood Hits",
                          imageName: "Memories",
                          artistName: "Maroon",
                          trackName: "Memories"))
        Songs.append(Song(name: "MERCY",
                          albumname: "Badshah-Album",
                          imageName: "Mercy",
                          artistName: "Badshah",
                          trackName: "Mercy"))
        Songs.append(Song(name: "LET ME LOVE YOU",
                          albumname: "DJ-Snake",
                          imageName: "LetMeLoveYou",
                          artistName: "Justin Bieber",
                          trackName: "LetMeLoveYou"))
        Songs.append(Song(name: "TERA SATH (DIL BECHARA)",
                          albumname: "Moddy",
                          imageName: "ArijitShingh",
                          artistName: "Arijit Shingh",
                          trackName: "ArijitShingh"))
        Songs.append(Song(name: "GENDA PHOOL",
                          albumname: "Badshah-Album",
                          imageName: "GendaPhool",
                          artistName: "Badshah",
                          trackName: "GendaPhool"))
        Songs.append(Song(name: "KHULKE JINE KA",
                          albumname: "Shushant Hits",
                          imageName: "DilBechara",
                          artistName: "Sushant Shingh",
                          trackName: "KhulkeJineKa"))
        
        Songs.append(Song(name: "SAKHIYAN",
                          albumname: "Panjabi-Album",
                          imageName: "Sakhiyan",
                          artistName: "Maninder Buttar",
                          trackName: "Sakhiyan"))
        Songs.append(Song(name: "MEMORIES",
                          albumname: "HollyWood Hits",
                          imageName: "Memories",
                          artistName: "Maroon",
                          trackName: "Memories"))
        Songs.append(Song(name: "MERCY",
                          albumname: "Badshah-Album",
                          imageName: "Mercy",
                          artistName: "Badshah",
                          trackName: "Mercy"))
        Songs.append(Song(name: "LET ME LOVE YOU",
                          albumname: "DJ-Snake",
                          imageName: "LetMeLoveYou",
                          artistName: "Justin Bieber",
                          trackName: "LetMeLoveYou"))
        Songs.append(Song(name: "TERA SATH",
                          albumname: "Moddy",
                          imageName: "ArijitShingh",
                          artistName: "Arijit Shingh",
                          trackName: "ArijitShingh"))
        Songs.append(Song(name: "GENDA PHOOL",
                          albumname: "Badshah-Album",
                          imageName: "GendaPhool",
                          artistName: "Badshah",
                          trackName: "GendaPhool"))
        Songs.append(Song(name: "KHULKE JINA KA",
                          albumname: "Shushant Hits",
                          imageName: "DilBechara",
                          artistName: "Sushant Shingh",
                          trackName: "KhulkeJineKa"))

        
       
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Songs.count
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100 
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let song = Songs[indexPath.row]
        
        cell.accessoryType = .disclosureIndicator
        
        cell.textLabel?.text = song.name
        cell.detailTextLabel?.text = song.albumname
        
        cell.imageView?.image = UIImage(named: song.imageName)
        
        cell.textLabel?.font = UIFont(name: "Helvetica-Bold", size: 18)
        cell.detailTextLabel?.font = UIFont(name: "Helvetica", size: 17)

        //configure
        
        
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        //present the player
        let position = indexPath.row
        
        guard let vc = storyboard?.instantiateViewController(identifier: "player") as? PlayerViewController else { return }
        vc.songs = Songs 
        vc.position = position
        present(vc , animated: true)
    }
}
struct Song {
    
    let name : String
    let albumname : String
    let imageName : String
    let artistName : String
    let trackName : String
    
}
