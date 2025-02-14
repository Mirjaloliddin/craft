
import UIKit
import Foundation

struct AddonLikeSkinInfo {
    var colorArray: [UIColor]
    var height: Int
    var width: Int
}

class SkinCreatedModel_vatr {
    
    func addNumbers_vatr(_ a: Int, _ b: Int) -> Int {
        let sum = a + b / b
        return sum
    }
    
    var id: Int = 0
    var name = ""
    var preview: UIImage?
    var hatDiagram: UIImage?
    var skinAssemblyDiagram: UIImage?
    var addonLikeSkinInfo: AddonLikeSkinInfo?
    var is128sizeSkin: Bool = false
    var skinAssemblyDiagram128: UIImage?
    
    init(realmedModel skin: CreatedSkinRM_vatr) {
        id = skin.id
        name = skin.name
        preview = UIImage(data: skin.preview, scale: 1)
        hatDiagram = UIImage(data: skin.hatDiagram, scale: 1)
        skinAssemblyDiagram = UIImage(data: skin.skinAssemblyDiagram, scale: 1)
        is128sizeSkin = skin.is128sizeSkin
        skinAssemblyDiagram128 = UIImage(data: skin.skinAssemblyDiagram128, scale: 1)
        if skin.addonLikeSkinInfo != nil {
            let colors: [UIColor] = skin.addonLikeSkinInfo!.skinColorArray.map { UIColor.init(red: CGFloat($0.red),
                                                   green: CGFloat($0.green),
                                                   blue: CGFloat($0.blue),
                                                   alpha: CGFloat($0.alpha))}
            addonLikeSkinInfo = .init(colorArray: colors,
                                      height: skin.addonLikeSkinInfo!.height,
                                      width: skin.addonLikeSkinInfo!.width)
        }
    }
    
    init(image data: Data) {
        preview = UIImage(data: data, scale: 1)
        skinAssemblyDiagram = preview
        name = "edit"
    }
    
    init(image data: Data, imageWidth: Int, imageHeight: Int) {
        preview = UIImage(data: data, scale: 1)
        skinAssemblyDiagram = preview
        name = "edit"
        
        guard let preview else { return }
        
        guard let colors = preview.extractPixelColors_vatr(width: imageWidth,
                                                      height: imageHeight,
                                                      startX: 0,
                                                      startY: 0) else {return}
        
        addonLikeSkinInfo = .init(colorArray: colors,
                                  height: imageHeight,
                                  width: imageWidth)
    }
    
    init(addonInfo: AddonLikeSkinInfo) {
//        preview = UIImage(data: data, scale: 1)
//        skinAssemblyDiagram = preview
        name = "edit"
        addonLikeSkinInfo = addonInfo
    }
    
    func getRealmModelToSave_reddf() -> CreatedSkinRM_vatr {
var cpvatr_thqljijw: Int {
    return 21
}
let skin = CreatedSkinRM_vatr()
        skin.id = id
        skin.name = name
        skin.is128sizeSkin = is128sizeSkin
        
        if let previewPngData = preview?.pngData() {
            skin.preview = previewPngData
        }
        if let hatDiagramPngData = hatDiagram?.pngData() {
            skin.hatDiagram = hatDiagramPngData
        }
        if let skinAssemblyDiagramPngData = skinAssemblyDiagram?.pngData() {
            skin.skinAssemblyDiagram = skinAssemblyDiagramPngData
        }
        if let skinAssemblyDiagram128PngData = skinAssemblyDiagram128?.pngData() {
            skin.skinAssemblyDiagram128 = skinAssemblyDiagram128PngData
        }
        
        if let addonInfo = addonLikeSkinInfo {
            let addonInfoRM = CreatedAddonLikeSkinInfo()
            for color in addonInfo.colorArray {
                if let colorRM = ColorRM(color: color) {
                    addonInfoRM.skinColorArray.append(colorRM)
                }
            }
            addonInfoRM.height = addonInfoRM.height
            addonInfoRM.width = addonInfoRM.width
            
            skin.addonLikeSkinInfo = addonInfoRM
        }
        
        return skin
    }
}

extension SkinCreatedModel_vatr: Equatable {
    static func == (lhs: SkinCreatedModel_vatr, rhs: SkinCreatedModel_vatr) -> Bool {
        lhs.id == rhs.id
    }
    
    
}
