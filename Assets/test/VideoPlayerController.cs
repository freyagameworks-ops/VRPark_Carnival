using UnityEngine;
using UnityEngine.Playables;
using UnityEngine.UI;

public class VideoPlayerController : MonoBehaviour
{
	public PlayableDirector timelineDirector;

	public Button playPauseButton;

	public Button rewindButton;

	public Button fastForwardButton;

	public Slider timelineSlider;

	private bool _isPlaying;

	private bool _isScrubbing;

	private void Update()
	{
		if (!_isScrubbing && timelineDirector.state == PlayState.Playing)
		{
			timelineSlider.value = (float)timelineDirector.time;
		}
	}

	public void TogglePlayPause()
	{
		_isPlaying = !_isPlaying;
		if (_isPlaying)
		{
			timelineDirector.Play();
		}
		else
		{
			timelineDirector.Pause();
			Debug.Log("SADASDASD");
		}
	}

	private void Start()
	{
		playPauseButton.onClick.AddListener(TogglePlayPause);
		rewindButton.onClick.AddListener(Rewind);
		fastForwardButton.onClick.AddListener(FastForward);
		timelineSlider.onValueChanged.AddListener(ScrubTimeline);
		timelineSlider.minValue = 0f;
		timelineSlider.maxValue = (float)timelineDirector.duration;
		timelineSlider.value = 0f;
		_isPlaying = true;
	}

	public void Rewind()
	{
		timelineDirector.time = Mathf.Max((float)timelineDirector.time - 5f, 0f);
		timelineSlider.value = (float)timelineDirector.time;
	}

	public void FastForward()
	{
		timelineDirector.time = Mathf.Min((float)timelineDirector.time + 5f, (float)timelineDirector.duration);
		timelineSlider.value = (float)timelineDirector.time;
	}

	public void ScrubTimeline(float value)
	{
		if (_isScrubbing || !_isPlaying)
		{
			timelineDirector.time = value;
		}
	}

	public void OnBeginDrag()
	{
		_isScrubbing = true;
		timelineDirector.Pause();
	}

	public void OnEndDrag()
	{
		_isScrubbing = false;
		if (_isPlaying)
		{
			timelineDirector.Play();
		}
	}
}
