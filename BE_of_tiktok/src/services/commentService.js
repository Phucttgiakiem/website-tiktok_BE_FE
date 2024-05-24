import db from "../models/index";

let GetCountcomment = (idpost) => {
    return new Promise (async(resolve,reject) => {
        try {
            let countcomment = await db.Comment.count({
                where: {PostID:idpost}
            })
            if(countcomment > 0) resolve(countcomment);
            else resolve(0);
        } catch (error) {
            reject(error)
        }
    });
}
module.exports = {
    GetCountcomment : GetCountcomment
}