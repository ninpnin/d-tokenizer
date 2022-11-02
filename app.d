import std.stdio;
import std.string;
import std.uni;
import std.algorithm;
import std.range;
import std.utf : byChar;

string most_common(string[] words) {
    int[string] dictionary;
    foreach(w; words) {
        if (!(w in dictionary)) {
            dictionary[w] = 1;
        } else {
            dictionary[w] = dictionary[w] + 1;
        }
    }
    string common;
    int common_count = 0;
    foreach (word; sort(dictionary.keys))
    {
        if (dictionary[word] > common_count) {
            common = word;
            common_count = dictionary[word];
        }
    }
    return common;
}

void main()
{
    int[string] dictionary;
    string filepath = "testfile.txt";
    File file = File(filepath, "r");
    string s = file.readln();
    s = std.uni.toLower(s);
    writeln(s);
    file.close();

    int ix = 0;
    auto words = s.split;
    foreach(w; words) {
        if (!(w in dictionary)) {
            dictionary[w] = ix;
            ix += 1;
        }
    }
    writeln(dictionary);

    string mc = most_common(words);
    writeln(mc);
}