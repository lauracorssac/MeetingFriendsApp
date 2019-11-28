import 'package:meeting_friends/Models/Meeting.dart';
import 'dart:async';
import 'package:meeting_friends/Service/ServiceAdapter.dart';

class MeetingsAPIHardCoded implements ServiceAdapter {

  Future<List<Meeting>> getMeetings() async {

    Meeting meeting1 = Meeting(title: "Hackathon para terminar o trabalho",
        description: "Vamos nos reunir para enviar aquele agora vai! Força, Foco e Fé!",
        date: "Um dia antes da apresentação do trabalho final",
        place: "Casa do Gui",
        price: "Suor e trabalho árduo não tem preço",
        creator: "Aluno1");

    Meeting meeting2 = Meeting(title: "Abraço coletivo no Pimenta",
        description: "Vamos todos abraçar o professor que vai ser muito legal nas avaliações",
        date: "Dia da apresentação do trabalho final",
        place: "Campus do Value - UFRGS",
        price: "Grátis",
        creator: "Aluno2");

    Meeting meeting3 = Meeting(title: "Retrospectiva pós entrega",
        description: "Dia de fazer um Happy Hour para discutirmos o processo de desenvolvimento do trabalho. Bebida só depois dos feedbacks.",
        date: "Depois da apresentação",
        place: "Boteco do Joaquim - CB",
        price: "Preço varia entre 0 - 70 por pessoa",
        creator: "Aluno3");

    return Future.delayed(const Duration(milliseconds: 3000), () => [meeting1, meeting2, meeting3]);

  }

  Future<bool> saveMeeting(Meeting meeting) async {

    return Future.delayed(const Duration(milliseconds: 3000), () => true);

  }
}
