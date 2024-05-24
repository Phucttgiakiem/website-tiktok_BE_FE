import { where } from "sequelize";
import db from "../models/index";

let GetAllLikepost = (idPost) => {
    
    return new Promise (async(resolve,reject)=> {
        try {
            let alllike = await db.Likepost.count({
                where: {PostID:idPost}
            });
            
            if(alllike){
                resolve(alllike);
            }else {
                resolve(0);
            }
        } catch (error) {
            reject(error)
        }
    })
}
module.exports = {
    GetAllLikepost:GetAllLikepost
}