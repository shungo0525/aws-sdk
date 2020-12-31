import UIKit
import AWSDynamoDB

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        fetchDynamoDBTableName()
    }
    
    private func fetchDynamoDBTableName() {
        let dynamoDB = AWSDynamoDB.default()
        let listTableInput = AWSDynamoDBListTablesInput()
        dynamoDB.listTables(listTableInput!).continueWith { (task:AWSTask<AWSDynamoDBListTablesOutput>) -> Any? in
            if let error = task.error as? NSError {
            print("Error occurred: \(error)")
                return nil
            }

            let listTablesOutput = task.result

            for tableName in listTablesOutput!.tableNames! {
                print("\(tableName)")
            }

            return nil
        }
    }
}
