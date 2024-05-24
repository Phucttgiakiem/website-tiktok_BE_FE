import express from "express";
import homeController from "../controllers/homeController";
import userController from "../controllers/userController";
import postController from "../controllers/postController";
let router = express.Router();

let initWebRoutes = (app) => {
    router.get('/',homeController.getHomePage);
    router.post('/api/login',userController.handleLogin);
    router.post('/api/register',userController.handleRegister);
    router.post('/api/choosepass',userController.handleChoosepass);
    router.post('/api/getPost',postController.GetAllPost);
    router.get('/crud',homeController.getCRUD);
    return app.use("/",router);
}

module.exports = initWebRoutes;

