//
//  DemoURL.swift
//  Cassini
//
//  Created by 张经纬 on 2018/7/13.
//  Copyright © 2018 Jingwei Zhang. All rights reserved.

import Foundation

struct DemoURL
{
    static let daniel = URL(string: "https://www.utoronto.ca/sites/default/files/cover_vicreport_winter18_heal-v1.jpg")
    static var NASA: Dictionary<String,URL> = {
        let NASAURLStrings = [
            "Cassini" : "http://www.jpl.nasa.gov/images/cassini/20090202/pia03883-full.jpg",
            "Earth" : "http://www.nasa.gov/sites/default/files/wave_earth_mosaic_3.jpg",
            "Saturn" : "http://www.nasa.gov/sites/default/files/saturn_collage.jpg"
        ]
        var urls = Dictionary<String,URL>()
        for (key, value) in NASAURLStrings {
            urls[key] = URL(string: value)
        }
        return urls
    }()
    
    
}
