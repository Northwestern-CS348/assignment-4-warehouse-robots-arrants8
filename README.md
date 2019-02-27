# Assignment 4—Planning

## Warehouse Robots!

Welcome to your new job at **Disruptive Technologies**. You've been tasked with helping write the managerial software for the new high-tech warehouses located in Chicago.

The job is pretty straightforward: **Disruptive Technologies** has a number of fancy pallet-moving robots that can help out in their warehouses. They have built a planner to control them but they haven't yet put together knowledge about the specifics of what __objects__ exist, what __predicates__ apply to them, and what __actions__ are possible.

That's where you come in, given your knowledge of AI (and the fact that you're an intern, which means that you're super cheap). You'll be applying that knowledge on getting these robots to move stock around the warehouse.

The robots are capable of **picking** up pallets and **moving** them around  the warehouse. Strong they might be, dexterous they are not. They can get the pallets to the unloading area, but they need to rely on humans to take the specific items off of them. This is typical of the real world, where robots are good at parts of tasks that humans fail at, but drop the ball completely when it comes to things like fine motor control.

## Your Task

You have been given seven **problem definitions** and a skeleton of a **domain file**. The first five are problems that your domain needs to be able to solve, the sixth and seventh are problems that your domain should **fail to create a plan for**. This is to help you verify that you're creating a domain that accounts for things like not allowing an individual stock item to be in multiple shipments.

                *There will be tests like this in our grading setup*.

You will get graded on whether you pass/fail tests that we expect you to.

## The Files

To run the planner, you need two kinds of files: **domain** and **problem**.  The domain file that defines the abstract ontology of what sorts of things exist in the world, how they relate to each other and what actions you can take. The problem files define a specific state of the world (**objects** and **facts** about them) and the goals you are trying to accomplish.

The problem files you are using describe the specific state of the world that exists in the factory on different days. Each defines a set of **objects**, initial **predicates**, and **goals**.

The domain file (**warehouse\_world.pddl**) defines the different types of **objects** that exist in general, the **predicates** that can be applied to them, and then an example **action** (**startShipment**).  Your job is to build out the rest of the actions that you need to get the job done.

Once you have defined all of the actions, you will be able to run the planner using the domain file (**warehouse\_world.pddl**) and each of the problem files.

## The Domain File

We've given you a domain file. It contains the domain name, type information, the possible predicates and one action, **startShipment**, that takes a **shipment**, **order**, and **location**.

Your job is to add an additional set of actions:

* **robotMove**: Moves the robot between locations. Requires two locations and the robot.

* **robotMoveWithPallette**: Move the robot and a palette between locations. Requires two locations, the robot and a pallet.

* **moveItemFromPalletteToShipment**: Move items from a palette to a shipment. Requires a location , a shipment,  a saleitem, a palette, and an order.

* **completeShipment**: Completes the shipment process. Requires a shipment, an order, and a location.

Each action is defined by the objects it refers to (:parameters), the preconditions (:precondition), and the effects (:effect).

## The Online Editor/Planner

You can are going to use an online **PDDL** editor at that you can find at:

                                                            [http://editor.planning.domains](http://editor.planning.domains)

* You can upload all of the ***problem*** files that we've distributed using `File>Load`.
* You then upload the framework file and add in the actions needed for the robot to manage moving the products around.
* When you're ready to test, you can click `Solve`, select the **domain** and **problem** definitions that you'd like to use, and then click `Plan`. The system will run for a bit (for more complicated problems, upwards of ten seconds) and then give you the results.
* Regularly save your work in GitHub. Using `File>Save`, download your work and push it to GitHub.  We will only be grading files that you have pushed to GitHub

## Testing Your Work

We've given you a seven problem definitions. The first five (days 0-4) are tests that you need to pass. They increase in complexity, so don't be surprised if initially you pass the first few but not the later .

The last two (Saturday and Sunday) are tests that you **should fail**.  They're there to validate that your preconditions and effects are in good shape.

## Notes

To see example domain/problem definitions, you can click on `Import`. There are a ton of old definitions from, e.g., planning competitions.


