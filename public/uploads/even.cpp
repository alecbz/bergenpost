#include <fstream>
using namespace std;

int main(int argc, char** argv)
{
  ifstream fin(argv[1]);
  ofstream fout("even.out");
  int N;
  fin >> N;
  int temp;
  bool power = true;
  for(int i = 0; i < N;i++)
  {
    fin >> temp;
    while(temp != 1)
    {
      if(temp % 2 != 0)
      {
	power = false;
	break;
      }
      temp /= 2;
    }
    if(power) fout << "yes\n";
    else fout << "no\n";
    power = true;
  }
  return 0;
}
