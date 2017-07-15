//
//  LJFileManager.swift
//  TFSwift
//
//  Created by 孙伟伟 on 2017/7/15.
//  Copyright © 2017年 孙伟伟. All rights reserved.
//

import Foundation

class LJFileManager{
    
    //存储图片的文件夹
    var  ljFilePath:String = NSHomeDirectory() + "/Documents/" + "LJImageCache/"
    
    //单例
    public static let shared = LJFileManager()
    
    
    //创建文件夹
    func createDir(_ dir : String) -> Bool{
        do{
            try FileManager.default.createDirectory(at: NSURL(fileURLWithPath: dir, isDirectory: true) as URL, withIntermediateDirectories: true, attributes: nil)
        }catch{
            return false
        }
        return true
    }
    
    //检测文件夹是否存在，不存在则创建一个文件夹
    func isExistFileDir(_ path : String) -> Bool {
        let exist = FileManager.default.fileExists(atPath:path)
        if exist {
            return true
        }else{
            if self.createDir(path) {
                return true
            }
            return false
        }
    }
    
    /// 删除文件 - 根据文件路径
     func deleteFile(_ path : String) -> Bool{
        if(!isExistFileDir(path)){
            return true
        }
        do{
            try FileManager.default.removeItem(atPath: path)
        }catch{
            return false
        }
        return true
    }
    
    /**
     清除所有的缓存
     returns: Bool
     */
     func deleteAll() -> Bool{
        do{
            try FileManager.default.removeItem(atPath: ljFilePath)
        }catch{
            return false
        }
        return true
    }
    
    /* 写文件
       fileName: 文件名称
       data: 数据data
    */
    func writeFile(_ fileName:String , _ data:NSData) -> Bool{
        
        //let filePath:String = NSHomeDirectory() + "/Documents/" + fileName.md5
        //return  data.write(toFile: filePath, atomically: true)
        guard self.isExistFileDir(ljFilePath) else{
           return false
        }
        
        guard let filePath : String = ljFilePath + fileName.md5 else{
            return false
        }
        return data.write(toFile: filePath, atomically: true)
    }
    
    //读取文件 -（根据路径）
    func readFileFromCache(_ path:String) -> NSData?{
        
        if self.isExistFileDir(ljFilePath)
        {
            let ljpatch = ljFilePath + path.md5
            var result:NSData?
            do{
                result = try NSData(contentsOfFile: ljpatch, options: Data.ReadingOptions.uncached)
            }catch{
                return nil
            }
            return result
        }
        return nil
    }
}

