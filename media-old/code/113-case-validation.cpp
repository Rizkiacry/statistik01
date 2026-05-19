
#include <iostream>
#include <fstream>
using namespace std;

int main() {
    fstream file;
    file.open("data.txt");
    string baris;
    while (getline(file, baris)) {
        cout << baris << endl;
    }
    file.close();
    return 0;
}
