const { Router } = require('express');
const { redirect } = require('express/lib/response');
const { resolve } = require('path');
const Instructor = require('../models/Instructor');
const Plan = require('../models/Plan');

const router = Router();
router.get('/', (req, res) => {
    res.render('index');
});

router.get('/about', (req, res) => {
    res.render('about');
});
router.get('/contact', (req, res) => {
    res.render('contact');
});
router.get('/register', (req, res) => {
    res.render('add-student');
    if (res.body == 0) {
        res.redirect('register')
    }
});
router.post('/register-submit', (req, res) => {
    let { surname, first_name, other_name, dob, plan, email, phone, disability, gender, password } = req.body
    console.log(req.body);
})

router.get('/add-instructor', (req, res) => {
   res.render('add-instructor')
})

router.post('/add-instructor', async (req, res) => {
    let {confirm_password, ...otherFields} = req.body
    let instructor = new Instructor(otherFields)
    await instructor.save()
    res.redirect("/instructors")
})

router.get('/instructors', async (req, res) => {
    let instructors = await Instructor.fetch();    
    res.render('instructors', {instructors})
})
router.get('/edit-instructor/:instructor_id', async (req, res)=>{
    let instruct = await Instructor.findById(req.params.instructor_id)
    if (instruct) {
        res.render('edit-instructor', {instruct})
    } else {
        res.redirect('/instructors')
    }
})
router.get('/delete-instructor/:instructor_id', async (req, res)=>{
    let instruct = await Instructor.findById(req.params.instructor_id)
    await instruct.delete()
    res.redirect('/instructors')
});
router.get('/add-plan', (req, res) => {
    res.render('add-plan')
 })
router.post('/add-plan', async (req, res) => {
    let plan = new Plan(req.body)
    await plan.save()
    res.redirect("/plans")
})
router.get('/plans', async (req, res) => {
    let plans = await Plan.fetch();    
    res.render('plans', {plans})
})
router.get('/edit-plan/:plan_id', async (req, res)=>{
    let plan = await Plan.findById(req.params.plan_id)
    if (plan) {
        res.render('edit-plan', {plan})
    } else {
        res.redirect('/plans')
    }
})
router.post('/edit-plan/:plan_id', async (req, res)=>{
    let plan = await Plan.findById(req.params.plan_id)
    let { name, price, description } = req.body
    plan.name = name
    plan.price = price
    plan.description = description
    await plan.update()
    res.redirect('/plans')
})
router.get('/delete-plan/:plan_id', async (req, res)=>{
    let plan = await Plan.findById(req.params.plan_id)
    await plan.delete()
    res.redirect('/plans')
});



router.get('/add-course', (req, res) => {
    res.render('add-course')
 })
router.post('/add-course', async (req, res) => {
    let plan = new Plan(req.body)
    await plan.save()
    res.redirect("/courses")
})
router.get('/courses', async (req, res) => {
    let course = await Plan.fetch();    
    res.render('courses', {course})
})
router.get('/edit-course/:course_id', async (req, res)=>{
    let plan = await Plan.findById(req.params.course_id)
    if (plan) {
        res.render('edit-plan', {plan})
    } else {
        res.redirect('/plans')
    }
})
router.post('/edit-plan/:plan_id', async (req, res)=>{
    let plan = await Plan.findById(req.params.plan_id)
    let { name, price, description } = req.body
    plan.name = name
    plan.price = price
    plan.description = description
    await plan.update()
    res.redirect('/plans')
})
router.get('/delete-course/:plan_id', async (req, res)=>{
    let plan = await Plan.findById(req.params.course_id)
    await plan.delete()
    res.redirect('/plans')
});
module.exports = router;