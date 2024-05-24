import { where } from "sequelize";
import db from "../models/index";

let GetAllFollowofUser = (IdUser) => {
    return new Promise(async(resolve,reject) => {
        try{
            let followData = {}
            let follow = await db.Follow.findAll({
                attributes: ['userID','userIDsub'],
                where: {userIDsub:IdUser},
                raw: true
            })
            followData.errCode = 0;
            followData.errMessage = 'OK';
            if(follow != {}){
                followData.data = follow;
            }
            else followData.data = {};
           
            resolve(followData);
        }catch(e){
            reject(e);
        }
    });
}

module.exports = {
    GetAllFollowofUser : GetAllFollowofUser
}