import db from "../models/index";
import bcrypt from "bcryptjs";

let handleUserLogin = (email,password) => {
    return new Promise(async(resolve,reject)=>{
        try{
            let userData = {};
                let isExist = await checkUseremail(email);
                if (isExist) {
                    //user already exist
                    //compare password

                    let user = await db.User.findOne({
                        attributes: ['email','password'],
                        where: { email: email },
                        raw: true

                    });
                    if (user) {
                        let check = bcrypt.compareSync(password, user.password); // false
                        //let check = true;
                        if (check) {
                            userData.errCode = 0;
                            userData.errMessage = 'OK';
                            console.log(user)
                            delete user.password;
                            userData.user = user;
                        } else {
                            userData.errCode = 3;
                            userData.errMessage = 'Wrong password';
                        }
                    } else {
                        userData.errCode = 2;
                        userData.errMessage = `User's not found`
                    }

                } else {
                    //return error
                    userData.errCode = 1;
                    userData.errMessage = "Your's Email isn't exist in your system. plz try other email!"

                }
                resolve(userData);
        } catch (e) {
            reject(e)
        }
    })
}
let handleUserRegister = (email,password,dateofbirth) => {
    return new Promise (async(resolve,reject) =>{
        try{
            let userData = {};
            let isExist = await checkUseremail(email);
                if (isExist) {
                    //user already exist
                    userData.errCode = 1;
                    userData.errMessage = "Please choose another Email because It is exist in system";
                }
                else {
                    // create one salt
                    const saltRounds = 5;
                    const salt = bcrypt.genSaltSync(saltRounds);
                    // create new pass
                    let hashedpass = bcrypt.hashSync(password,salt);
                    // add new user to database
                    let newUser = await db.User.create({
                        email: email,
                        password: hashedpass, // save pass was hast pass
                        dateofbirth: dateofbirth
                    });
                    // create data response
                    userData.errCode = 0;
                    userData.errMessage = 'OK';
                    userData.user = newUser.email;
                    
                }
                resolve(userData);
        }catch(e){
            reject(e)
        }
    })
}
let handleChoosePass = (email,newpass) => {
    return new Promise(async(resolve,reject) => {
        try{
            let userData = {};
            let isExist = await checkUseremail(email);
            if (isExist) {
                //user already exist
                //compare password

                let user = await db.User.findOne({
                    attributes: ['email','password'],
                    where: { email: email },
                    raw: true
                });
                if (user) {
                    let check = bcrypt.compareSync(newpass, user.password);
                    //let check = true;
                    if (check) {
                        userData.errCode = 1;
                        userData.errMessage = 'password was using please choose another pass !';
                        console.log(user);
                        userData.user = user.email;
                    }
                    else {
                        userData.errcode = 0;
                        userData.errMessage = 'OK';
                        userData.user = user.email;

                        // create one salt
                        const saltRounds = 5;
                        const salt = bcrypt.genSaltSync(saltRounds);
                         // create new pass
                        let hashedpass = bcrypt.hashSync(newpass,salt);
                        await db.User.update({password : hashedpass},{where: {email: user.email}}) ;
                    }
                }
                else {
                    //return error
                    userData.errCode = 2;
                    userData.errMessage = "Your's Email isn't exist in your system. plz try other email!";

                }
                resolve(userData);
            }
        }catch(e){
            reject(e)
        }
    })
}
let checkUseremail = (emails) =>{
    return new Promise(async(resolve,reject)=>{
        try{
            let user = await db.User.findOne({
                where: {email:emails}
            })
            if(user){
                resolve(true)
            }
            else{
                resolve(false)
            }
        }catch(e){
            reject(e)
        }
    })
}
module.exports = {
    handleUserLogin : handleUserLogin,
    handleUserRegister : handleUserRegister,
    handleUserChoosepass : handleChoosePass
}