import 'package:atlas_icons/atlas_icons.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:yelwinoo/data/model/quote.dart';
import 'package:yelwinoo/data/model/route_model.dart';
import 'package:yelwinoo/data/model/showcase_project.dart';
import 'package:yelwinoo/data/model/social_media.dart';
import 'package:yelwinoo/presentation/route/routes.dart';

import 'constant_colors.dart';
import 'constant_sizes.dart';

/// constant strings are prefixed with [ks]
const String ksFontFamily = "Poppins";

const String ksFlutterDeveloperAnd = "Flutter Developer &";
const String ksAiEnthusiast = "AI/ML Enthusiast";
const String ksIntro = """
  Hi, I'm Ye Lwin Oo!
    - a passionate mobile developer from Myanmar
    - a CDM student from UCSM
    - an avid reader
  """;
const String ksSeeMyWork = "See my work";
const String ksHome = "Home";
const String ksAbout = "About";
const String ksExperience = "My Experience";
const String ksCertificates = "Certificates";
const String ksProject = "My Projects";
const String ksViewProject = "View Project";
const String ksCraftedWithLove = "Crafted with Love";
const String ksRecentProjects = "Here are a selection of my recent projects";
const String ksContact = "Contact Me";
const String ksGithub = "Github";
const String ksLinkedIn = "LinkedIn";
const String ksDiscord = "Discord";
const String ksSlash = "/";
const String ksLetsWork = "Let's work together!";
const String ksFreelanceAvailability = "I'm available for Freelancing";
const String ksContactInfo = "- Contact Info";
const String ksWorkEmail = "yelwinoo.work@gmail.com";
const String ksWorkPhone = "+959 976294818";
const String ksCreditTo = "- Heavily credit to";
const String ksDavidCobbina = "David Cobbina";
const String ksDavidCobbinaWebsite = "https://davidcobbina.com/";
const String ksJuliusG = "Design by Julius G";
const String ksJuliusGWebsite =
    "https://www.behance.net/gallery/63574251/Personal-Portfolio-Website-Design";
const String ksBuildUsing = "Build using ";
const String ksWithMuch = " with much ";
const String ksCC = "©️ 2023 Ye Lwin Oo";
final List<RouteModel> ksMenu = [
  RouteModel(label: ksHome, route: Routes.home),
  RouteModel(label: ksProject, route: Routes.projects),
  RouteModel(label: ksCertificates, route: Routes.certificates),
  RouteModel(label: ksAbout, route: Routes.about),
  RouteModel(label: ksContact, route: Routes.contact),
];
const String _nikolaTesla = "Nikola Tesla";
const String _kentBeck = "Kent Beck";
const String _linusTorvalds = "Linus Torvalds";
const String _donaldKnuth = "Donald Knuth";
const String _albertEinstein = "Albert Einstein";
const String _alanTuring = "Alan Turing";
const String _johnLennon = "John Lennon";
const String _steveJobs = "Steve Jobs";
const String _kurtCobain = "Kurt Cobain";
const String _jamesClear = "James Clear";
final List<Quote> ksQuotes = [
  Quote(
    name:
        "Our virtues and our failings are inseparable, like force and matter. When they separate, man is no more.",
    author: _nikolaTesla,
  ),
  Quote(
    name:
        "I’m not a great programmer. I’m just a good programmer with great habits.",
    author: _kentBeck,
  ),
  Quote(
    name: "I'm generally a very pragmatic person: that which works, works.",
    author: _linusTorvalds,
  ),
  Quote(
    name: "Premature optimization is the root of all evil.",
    author: _donaldKnuth,
  ),
  Quote(
    name:
        "Everyday life is like programming, I guess. If you love something you can put beauty into it.",
    author: _donaldKnuth,
  ),
  Quote(
    name: "A person who never made a mistake never tried anything new.",
    author: _albertEinstein,
  ),
  Quote(
    name: "I have no special talent. I am only passionately curious.",
    author: _albertEinstein,
  ),
  Quote(
    name:
        "Sometimes it is the people who no one imagines anything of who do the things that no one can imagine.",
    author: _alanTuring,
  ),
  Quote(
    name: "Life is what happens when you're busy making other plans.",
    author: _johnLennon,
  ),
  Quote(
    name: "The duty of youth is to challenge corruption.",
    author: _kurtCobain,
  ),
  Quote(
    name: "Stay hungry, stay foolish.",
    author: _steveJobs,
  ),
  Quote(
    name: "It's hard to build momentum if you're dividing your attention.",
    author: _jamesClear,
  ),
  Quote(
    name: "Deconstruction creates knowledge. Recombination creates value.",
    author: _jamesClear,
  ),
];

const String ksFacebookLink = 'https://www.facebook.com/ye.lwin.oo.someone';
const String ksGithubLink = 'https://github.com/YeLwinOo-Steve';
const String ksLinkedInLink = 'https://www.linkedin.com/in/ye-lwin-oo-ucsm/';
const String ksMediumLink =  'https://yelwino.medium.com/';
const String ksStackoverflowLink = 'https://stackoverflow.com/users/19209151/ye-lwin-oo';
const String ksDiscordLink = 'https://discordapp.com/users/809527318632071178';
final List<SocialMedia> ksSocialMedia = [
  SocialMedia(
    link: ksFacebookLink,
    icon: FaIcon(
      FontAwesomeIcons.facebook,
      color: kSecondary,
      size: s18,
    ),
  ),
  SocialMedia(
    link: ksGithubLink,
    icon: FaIcon(
      FontAwesomeIcons.github,
      color: kSecondary,
      size: s18,
    ),
  ),
  SocialMedia(
    link: ksLinkedInLink,
    icon: FaIcon(
      FontAwesomeIcons.linkedin,
      color: kSecondary,
      size: s18,
    ),
  ),
  SocialMedia(
    link: ksMediumLink,
    icon: FaIcon(
      FontAwesomeIcons.medium,
      color: kSecondary,
      size: s18,
    ),
  ),
  SocialMedia(
    link: ksStackoverflowLink,
    icon: FaIcon(
      FontAwesomeIcons.stackOverflow,
      color: kSecondary,
      size: s18,
    ),
  ),
  SocialMedia(
    link: ksDiscordLink,
    icon: FaIcon(
      FontAwesomeIcons.discord,
      color: kSecondary,
      size: s18,
    ),
  ),
];

const String dummyImage = "assets/images/projects/ggone.jpg";
final List<ShowcaseProject> ksShowcaseProjects = [
  ShowcaseProject(
    title: 'Pulse-X State Management',
    tags: [
      'flutter',
      'dart',
      'package',
    ],
    image: dummyImage,
    description:
        """
        Pulse X is the state management for Flutter projects. It has four features:
          - state management
          - context-less routing
          - dependency injection 
          - reaction (side effects)
        """,
    link: dummyImage,
    heroTag: 'pulse-x',
  ),
  ShowcaseProject(
    title: 'Notee Personal Management App',
    tags: ['flutter', 'dart', 'android', 'ios'],
    image: dummyImage,
    description:
        """
        Notee is a personal management app that includes four parts :
          - Note taking
          - To-Do List
          - Timer
          - Account Control
        """,
    link: dummyImage,
    heroTag: 'notee',
  ),
  ShowcaseProject(
    title: 'The Golden Land',
    tags: ['html', 'css', 'javascript', 'website'],
    image: dummyImage,
    description:
        """
        Web project showing Myanmar's Culture, Famous Places, Cuisine, Festivals, etc
        """,
    link: dummyImage,
    heroTag: 'the-golden-land',
  ),
];
