# Peer-Review for Programming Exercise 2 #

## Description ##

For this assignment, you will be giving feedback on the completeness of assignment two: Obscura. To do so, we will give you a rubric to provide feedback. Please give positive criticism and suggestions on how to fix segments of code.

You only need to review code modified or created by the student you are reviewing. You do not have to check the code and project files that the instructor gave out.

Abusive or hateful language or comments will not be tolerated and will result in a grade penalty or be considered a breach of the UC Davis Code of Academic Conduct.

If there are any questions at any point, please email the TA.   

## Due Date and Submission Information
See the official course schedule for due date.

A successful submission should consist of a copy of this markdown document template that is modified with your peer review. This review document should be placed into the base folder of the repo you are reviewing in the master branch. The file name should be the same as in the template: `CodeReview-Exercise2.md`. You must also include your name and email address in the `Peer-reviewer Information` section below.

If you are in a rare situation where two peer-reviewers are on a single repository, append your UC Davis user name before the extension of your review file. An example: `CodeReview-Exercise2-username.md`. Both reviewers should submit their reviews in the master branch.  

# Solution Assessment #

## Peer-reviewer Information

* *name:* [Minji Yun] 
* *email:* [myun@ucdavis.edu]

### Description ###

For assessing the solution, you will be choosing ONE choice from: unsatisfactory, satisfactory, good, great, or perfect.

The break down of each of these labels for the solution assessment.

#### Perfect #### 
    Can't find any flaws with the prompt. Perfectly satisfied all stage objectives.

#### Great ####
    Minor flaws in one or two objectives. 

#### Good #####
    Major flaw and some minor flaws.

#### Satisfactory ####
    Couple of major flaws. Heading towards solution, however did not fully realize solution.

#### Unsatisfactory ####
    Partial work, not converging to a solution. Pervasive Major flaws. Objective largely unmet.


___

## Solution Assessment ##

### Stage 1 ###

- [ ] Perfect
- [x] Great
- [ ] Good
- [ ] Satisfactory
- [ ] Unsatisfactory

___
#### Justification ##### 
Camera seems to be locked correctly. But there is no cross symbol. Therefore I give a great.

___
### Stage 2 ###

- [ ] Perfect
- [x] Great
- [ ] Good
- [ ] Satisfactory
- [ ] Unsatisfactory

___
#### Justification ##### 
Camera is scrolling and the target remains in the right place. But the camera movement seems to be diagonal not horizontal, this could be easily fixed.

___
### Stage 3 ###

- [x] Perfect
- [ ] Great
- [ ] Good
- [ ] Satisfactory
- [ ] Unsatisfactory

___
#### Justification ##### 
The target moves smoothly, can access all directions. The code implemented all directions correctly, perfect.

___
### Stage 4 ###

- [x] Perfect
- [ ] Great
- [ ] Good
- [ ] Satisfactory
- [ ] Unsatisfactory

___
#### Justification ##### 
The camera has the lagging behind effect and seems to be in the leash distance. The code implemented this very well, and line 41 shows the right calculation of the cathcup mechanic: [line 41](https://github.com/ensemble-ai/exercise-2-camera-control-richardzhangptc/blob/18f76b236486a48a67b7b35d59c635815ba4959a/Obscura/scripts/camera_controllers/lerp_target_focus.gd#L41)

___
### Stage 5 ###

- [x] Perfect
- [ ] Great
- [ ] Good
- [ ] Satisfactory
- [ ] Unsatisfactory

___
#### Justification ##### 
There is no visible box, but the speedup zone is implemented correctly. The target is able to speed up in all four corners and the camera movement is smooth. Perfect.
___
# Code Style #


### Description ###
Check the scripts to see if the student code adheres to the GDScript style guide.

If sections do not adhere to the style guide, please peramlink the line of code from Github and justify why the line of code has not followed the style guide.

It should look something like this:

* [description of infraction](https://github.com/dr-jam/ECS189L) - this is the justification.

Please refer to the first code review template on how to do a permalink.


#### Style Guide Infractions ####
I couldn't really find any infractions, so it seems like they are comfortable with Godot syntax and can use it correctly very well. The codes are organized neatly. There are some comments here and there that helped me to understand what they were doing with the lines or certain variables.
#### Style Guide Exemplars ####
[Good comment example](https://github.com/ensemble-ai/exercise-2-camera-control-richardzhangptc/blob/18f76b236486a48a67b7b35d59c635815ba4959a/Obscura/scripts/camera_controllers/lerp_target_focus.gd#L9C1-L9C71)
[line 17 to 137 with great code organization and blocked separation for readability](https://github.com/ensemble-ai/exercise-2-camera-control-richardzhangptc/blob/18f76b236486a48a67b7b35d59c635815ba4959a/Obscura/scripts/camera_controllers/four_way_speedup_push.gd#L17)
___
#### Put style guide infractures ####

___

# Best Practices #

### Description ###

If the student has followed best practices then feel free to point at these code segments as examplars. 

If the student has breached the best practices and has done something that should be noted, please add the infraction.


This should be similar to the Code Style justification.

#### Best Practices Infractions ####
Couldn't find any infractions in particular for best practices, but like I mentioned above, they efficiently used comments and organization techniques. They also used naming convetions the right way.

#### Best Practices Exemplars ####
[line 19-20 for good use of snake_case](https://github.com/ensemble-ai/exercise-2-camera-control-richardzhangptc/blob/18f76b236486a48a67b7b35d59c635815ba4959a/Obscura/scripts/camera_controllers/lerp_target_focus.gd#L19)
[PascalCase for class_name](https://github.com/ensemble-ai/exercise-2-camera-control-richardzhangptc/blob/18f76b236486a48a67b7b35d59c635815ba4959a/Obscura/scripts/camera_controllers/position_lock.gd#L1)
