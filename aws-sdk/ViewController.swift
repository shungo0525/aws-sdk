import UIKit
import AWSDynamoDB

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        fetchDynamoDBTableName()
        fetchDynamoDBData()
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
    
    private func fetchDynamoDBData() {
        let dynamoDBObjectMapper = AWSDynamoDBObjectMapper.default()
        let scanExpression = AWSDynamoDBScanExpression()
        dynamoDBObjectMapper.scan(User.self, expression: scanExpression).continueWith() { (task:AWSTask<AWSDynamoDBPaginatedOutput>!) -> Void in
            
            guard let items = task.result?.items as? [User] else { return }
            if let error = task.error as NSError? {
                print("The request failed. Error: \(error)")
                return
            }
            print(items)
        }
    }
}
